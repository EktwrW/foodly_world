import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:dart_openai/dart_openai.dart';
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
  }) async {
    late final Uint8List? imageBytes;

    try {
      final completion = await OpenAI.instance.chat.create(
        model: FoodlyStrings.GPT_3_5_TURBO_MODEL,
        user: '$businessName:$businessUuid',
        responseFormat: {'type': 'json_object'},
        temperature: 0.8,
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.system,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                '''Marketing expert generating ONLY exact JSON:
                - title: MUST be under 36 chars
                - subtitle: MUST be under 99 chars
                - description: MUST be under 369 chars
                Reject and regenerate if ANY field exceeds limits.''',
              ),
            ],
          ),
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
            ],
          ),
        ],
      );

      final messageContent = completion.choices.first.message.content?.first.text ?? '';
      final jsonResponse = jsonDecode(messageContent);

      if (generateImage.$1) {
        // Usar Replicate en lugar de DALL-E
        final imageUrl = await _replicateService.generateImage(prompt, businessName, generateImage.$2);
        imageBytes = await _replicateService.downloadImage(imageUrl);
      }

      // Validar límites de caracteres
      final title = jsonResponse['title'] as String;
      final subtitle = jsonResponse['subtitle'] as String;
      final description = jsonResponse['description'] as String;

      if (title.length > 36 || subtitle.length > 99 || description.length > 369) {
        throw Exception('Generated content exceeds character limits, please try again.');
      }

      return PromoGenerationResponse(
        title: title,
        subtitle: subtitle,
        description: description,
        imageBytes: imageBytes,
      );
    } catch (e) {
      throw Exception('Failed to generate promotion: $e');
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
