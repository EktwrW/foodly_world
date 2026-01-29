import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';

class AIPromoService {
  final ReplicateService _replicateService;

  const AIPromoService(this._replicateService);

  Future<PromoGenerationResponse> generatePromotion(
    String prompt, {
    required String businessName,
    required String businessUuid,
    required (bool, OpenAIImageStyle) generateImage,
    String? language,
  }) async {
    late final Uint8List? imageBytes;

    // Detectar idioma del prompt o usar el proporcionado
    final languageCode = language ?? 'en';
    final languageName = _getLanguageName(languageCode);

    // Retry hasta 3 veces si excede límites
    int attempts = 0;
    const maxAttempts = 3;

    while (attempts < maxAttempts) {
      try {
        final completion = await OpenAI.instance.chat.create(
          model: FoodlyStrings.GPT_3_5_TURBO_MODEL,
          user: '$businessName:$businessUuid',
          responseFormat: {'type': 'json_object'},
          temperature: attempts == 0 ? 0.7 : 0.5, // Reducir temperatura en retries
          maxTokens: 250, // Limitar tokens totales de la respuesta
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.system,
              content: [
                OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  '''You are a marketing expert. Generate a JSON with EXACTLY these fields:
{
  "title": "max 36 characters",
  "subtitle": "max 99 characters",
  "description": "max 369 characters"
}

CRITICAL RULES:
- ALL text MUST be in $languageName language
- Count characters BEFORE responding
- title: 36 chars MAX (not one more)
- subtitle: 99 chars MAX (not one more)
- description: 369 chars MAX (not one more)
- Use concise, impactful language appropriate for $languageName speakers
- NO explanations, ONLY the JSON''',
                ),
              ],
            ),
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.user,
              content: [
                OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  '$prompt\n\nIMPORTANT: Generate ALL content in $languageName. Remember: title≤36, subtitle≤99, description≤369 characters.',
                ),
              ],
            ),
          ],
        );

        final messageContent = completion.choices.first.message.content?.first.text ?? '';
        final jsonResponse = jsonDecode(messageContent);

        if (generateImage.$1) {
          final imageUrl = await _replicateService.generateImage(prompt, businessName, generateImage.$2);
          imageBytes = await _replicateService.downloadImage(imageUrl);
        }

        // Obtener y validar campos
        String title = (jsonResponse['title'] as String).trim();
        String subtitle = (jsonResponse['subtitle'] as String).trim();
        String description = (jsonResponse['description'] as String).trim();

        // Truncado inteligente si excede límites (preservando palabras completas)
        title = title.length > 36 ? _smartTruncate(title, 36) : title;
        subtitle = subtitle.length > 99 ? _smartTruncate(subtitle, 99) : subtitle;
        description = description.length > 369 ? _smartTruncate(description, 369) : description;

        // Si aún excede después del truncado, retry
        if (title.length > 36 || subtitle.length > 99 || description.length > 369) {
          attempts++;
          if (attempts >= maxAttempts) {
            throw Exception('Could not generate content within limits after $maxAttempts attempts');
          }
          continue; // Retry
        }

        return PromoGenerationResponse(
          title: title,
          subtitle: subtitle,
          description: description,
          imageBytes: imageBytes,
        );
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) {
          throw Exception('Failed to generate promotion after $maxAttempts attempts: $e');
        }
        // Esperar un poco antes de retry
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }

    throw Exception('Failed to generate promotion');
  }

  /// Trunca texto preservando palabras completas
  String _smartTruncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;

    // Truncar en el último espacio antes del límite
    final truncated = text.substring(0, maxLength);
    final lastSpace = truncated.lastIndexOf(' ');

    if (lastSpace > maxLength * 0.7) {
      // Si el último espacio está al menos al 70% del límite, cortar ahí
      return '${truncated.substring(0, lastSpace).trim()}...';
    } else {
      // Si no hay un buen punto de corte, cortar directo y agregar puntos suspensivos
      return '${truncated.substring(0, maxLength - 3).trim()}...';
    }
  }

  /// Convierte código de idioma a nombre completo
  String _getLanguageName(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case 'es':
        return 'Spanish';
      case 'en':
        return 'English';
      case 'pt':
        return 'Portuguese';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      case 'it':
        return 'Italian';
      default:
        return 'English'; // Default fallback
    }
  }
}

class ReplicateService {
  static final Dio _dio = Dio();
  static const _baseUrl = 'https://api.replicate.com/v1';
  static const _modelVersion = 'd782a412563ca745fddce97c26ff3e72c551deba88a835188374a8a3ab9b43cc';
  static final _replicateApiKey = di<BaseConfig>().replicateApiKey;
  static final _logger = di<Logger>();
  static const _imageWidth = 896;
  static const _imageHeight = 504;

  ReplicateService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization': 'Bearer $_replicateApiKey',
      'Content-Type': 'application/json',
      'Prefer': 'wait',
    };
  }

  Future<String> generateImage(
    String prompt,
    String businessName,
    OpenAIImageStyle style,
  ) async {
    try {
      final (guidanceScale, stylePrompt) = _getStyleParameters(style);

      final promptText =
          '''Professional promotional photograph for $businessName: $prompt, high quality and definition commercial photography, professional lighting, advertisement style. CRITICAL REQUIREMENTS:
          - ABSOLUTELY NO text, words, numbers, or character symbols included in the image
          - WIDE format only (16:9 landscape)
          - Professional advertising quality''';

      final predictionResponse = await _dio.post(
        '/predictions',
        data: {
          'version': _modelVersion,
          'input': {
            'prompt': promptText,
            'width': _imageWidth,
            'height': _imageHeight,
            'num_inference_steps': 7,
            'num_refine_steps': 5,
            'guidance_scale': guidanceScale,
            'faceswap_fast': true,
            'faceswap_slow': false,
            'save_embeddings': false,
          },
        },
      );

      if (predictionResponse.statusCode != 201) {
        _logger.e('Error Response: ${predictionResponse.data}');
        throw DioException(
          requestOptions: predictionResponse.requestOptions,
          message: 'Failed to create prediction: ${predictionResponse.data}',
        );
      }

      final predictionId = predictionResponse.data['id'] as String;

      // Polling con timeout
      int attempts = 0;
      const maxAttempts = 10;

      while (attempts < maxAttempts) {
        final statusResponse = await _dio.get('/predictions/$predictionId');

        final status = statusResponse.data;

        if (status['status'] == 'succeeded') {
          return status['output'] as String;
        } else if (status['status'] == 'failed') {
          throw Exception('Image generation failed: ${status['error']}');
        }

        attempts++;
        await Future.delayed(const Duration(seconds: 1));
      }

      throw Exception('Timeout waiting for image generation');
    } on DioException catch (e) {
      _logger.e('Dio Error: ${e.response?.data}');
      throw Exception('Failed to generate image: ${e.message}');
    }
  }

  Future<Uint8List> downloadImage(String imageUrl) async {
    try {
      final response = await _dio.get<List<int>>(
        imageUrl,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {}, // Limpiamos los headers para la descarga de la imagen
        ),
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to download image: ${response.statusCode}',
        );
      }

      return Uint8List.fromList(response.data!);
    } on DioException catch (e) {
      throw Exception('Failed to download image: ${e.message}');
    }
  }

  (double, String) _getStyleParameters(OpenAIImageStyle style) {
    switch (style) {
      case OpenAIImageStyle.natural:
        return (
          1.77, // guidance_scale estándar para un look más natural
          'realistic style, natural lighting, photorealistic details'
        );
      case OpenAIImageStyle.vivid:
        return (
          2.5, // guidance_scale más alto para colores más vibrantes
          'vivid colors, enhanced contrast, dramatic lighting, high saturation, vibrant and eye-catching'
        );
    }
  }
}
