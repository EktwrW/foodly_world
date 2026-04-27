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
    required String businessCategory,
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
          model: FoodlyStrings.GPT_4O_MINI_MODEL,
          user: '$businessName:$businessUuid',
          responseFormat: {'type': 'json_object'},
          temperature: attempts == 0 ? 0.7 : 0.5, // Reducir temperatura en retries
          maxTokens: 350, // Limitar tokens totales de la respuesta (incluye image_prompt)
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.system,
              content: [
                OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  '''You are a marketing copywriter for a food & beverage app. The user will describe a promotion for a business in the "$businessCategory" category. Your job is to turn it into attractive marketing copy that ACCURATELY represents the EXACT same deal.

Generate a JSON with EXACTLY these fields:
{
  "title": "max 36 characters",
  "subtitle": "max 99 characters",
  "description": "max 369 characters",
  "image_prompt": "max 120 characters, English only"
}

ACCURACY RULES (MOST IMPORTANT):
- The deal in your copy MUST match the user's promotion EXACTLY. If they say "2x1", your text must convey "buy one get one free" or "2 for the price of 1" — NEVER change it to a different deal like "3rd free" or "50% off".
- "2x1" = pay for 1, get 2. "3x2" = pay for 2, get 3. NEVER confuse these.
- Do NOT invent, add, or change any aspect of the deal (price, quantity, conditions).

CONTENT RULES:
- title, subtitle, description MUST be in $languageName
- Write compelling, punchy marketing copy that makes the deal irresistible
- title: catchy hook, max 36 chars
- subtitle: expand the deal with urgency or appeal, max 99 chars
- description: full details with a call to action, max 369 chars
- Count characters BEFORE responding

IMAGE PROMPT RULES:
- image_prompt: ALWAYS in English, max 120 chars
- Describe ONLY a visual scene appropriate for a "$businessCategory" business
- The scene must show products/items typical of this category (e.g. cocktails for a bar, pastries for a bakery, coffee for a café, dishes for a restaurant)
- Example for bar: "two cold craft beers with lime wedges on a rustic wooden counter, moody ambient lighting"
- Example for café: "latte art cappuccino with a fresh croissant on a marble table, morning sunlight"
- NO numbers, NO prices, NO deals, NO promotional words, NO text to render, NO brand names
- Pure visual description of the products and setting

Output ONLY the JSON, nothing else.''',
                ),
              ],
            ),
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.user,
              content: [
                OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  'Promotion: $prompt\n\nGenerate marketing copy in $languageName that accurately represents THIS EXACT deal. Do not change the deal. title≤36, subtitle≤99, description≤369 chars. image_prompt in English ≤120 chars (visual scene only, no text/numbers).',
                ),
              ],
            ),
          ],
        );

        final messageContent = completion.choices.first.message.content?.first.text ?? '';
        final jsonResponse = jsonDecode(messageContent);

        // Obtener y validar campos
        String title = (jsonResponse['title'] as String).trim();
        String subtitle = (jsonResponse['subtitle'] as String).trim();
        String description = (jsonResponse['description'] as String).trim();

        if (generateImage.$1) {
          // Usar image_prompt generado por GPT (visual-only, sin texto promocional)
          // en lugar del prompt raw del usuario que contiene "2x1", "gratis", etc.
          final imagePrompt = (jsonResponse['image_prompt'] as String?)?.trim() ?? prompt;
          final imageUrl = await _replicateService.generateImage(
            imagePrompt,
            businessName,
            generateImage.$2,
            businessCategory: businessCategory,
          );
          imageBytes = await _replicateService.downloadImage(imageUrl);
        }

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

  // ✅ NUEVO: Z-Image-Turbo model (más rápido y económico)
  // Usa el modelo más reciente disponible
  static const _modelVersion = 'prunaai/z-image-turbo';

  static final _replicateApiKey = di<BaseConfig>().replicateApiKey;
  static final _logger = di<Logger>();

  // Resolución pareada con `ImageHelper::MAX_DIMENSION = 1280` en el BE.
  //
  // Antes (Apr 2026): 896×512 = 458 752 px → tier $0.0025 (≤ 0.5 MP).
  // Ahora: 1280×720 = 921 600 px → tier $0.005 (≤ 1 MP). +100 % costo
  // por imagen, pero la calidad final salta de "softish 700×400" a
  // "HD 1280×720 sin downsample" porque el cap del BE (1280) ahora
  // coincide con el lado mayor de la fuente.
  //
  // 16:9 es OBLIGATORIO acá: los widgets de promo en el FE
  // (edit_promo_media.dart línea 43, manage_promotion_card.dart línea
  // 37) renderizan dentro de `AspectRatio: 16/9`, y el image cropper
  // del editor también está hardcodeado a 16:9
  // (`CropAspectRatioPreset.ratio16x9`). Generar a 1:1 o 3:2 produciría
  // letterboxing o cropping inconsistente con las imágenes subidas
  // manualmente por el manager.
  //
  // El cap mensual por business sigue en `ai_promo_monthly_limit = 6`
  // (ver `Business` model), así el incremento de costo es 6 × $0.0025
  // = +$0.015/business/mes. Aceptable para el volumen actual.
  //
  // Alternativas dentro del mismo tier $0.005, manteniendo 16:9:
  //   - 1024 × 576 = 589 824 px (más barato en bandwidth, ligeramente
  //     menor calidad final ya que el BE no downsamplea pero sí pasa
  //     por re-encode JPEG). Útil si subimos el volumen y queremos
  //     bajar el costo de storage/bandwidth.
  static const _imageWidth = 1280;
  static const _imageHeight = 720;

  ReplicateService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization': 'Bearer $_replicateApiKey',
      'Content-Type': 'application/json',
      'Prefer': 'wait', // Mantener para respuesta síncrona
    };
  }

  Future<String> generateImage(
    String prompt,
    String businessName,
    OpenAIImageStyle style, {
    String? businessCategory,
  }) async {
    try {
      final stylePrompt = _getStylePrompt(style);
      final category = businessCategory?.toLowerCase() ?? 'restaurant';

      // ✅ Prompt optimizado para z-image-turbo
      // - El $prompt viene de GPT como image_prompt: escena visual pura en inglés
      // - Sin texto promocional, sin números, sin ofertas — solo descripción visual
      // - NO mencionar equipos (camera, DSLR, lens, tripod) — el modelo los renderiza literalmente
      // - Categoría del negocio para contextualizar la escena
      final promptText =
          '''$stylePrompt $prompt. $category setting, shallow depth of field, bokeh background, clean uncluttered scene, warm inviting tones, wide landscape composition, sharp focus on products, high detail, photorealistic quality. No text, no words, no letters, no numbers, no watermarks, no captions, no titles, no overlay, no cameras, no equipment, no hands, clean image only.''';

      final predictionResponse = await _dio.post(
        '/predictions',
        data: {
          'version': _modelVersion,
          'input': {
            'prompt': promptText,
            'width': _imageWidth,
            'height': _imageHeight,

            // ✅ OPTIMIZACIÓN: z-image-turbo parámetros óptimos
            // num_inference_steps: 9 resulta en ~8 pasos forward (óptimo para este modelo)
            // El modelo está optimizado específicamente para 8 pasos
            'num_inference_steps': 9,

            // ✅ CRÍTICO: guidance_scale DEBE ser 0.0 para modelos turbo
            // Estos modelos están destilados sin classifier-free guidance
            'guidance_scale': 0.0,

            // ✅ OPCIONAL: seed para reproducibilidad (si lo necesitas)
            // 'seed': 42, // Descomenta si quieres resultados reproducibles
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

      // ✅ MEJORA: Polling optimizado
      // z-image-turbo es MÁS RÁPIDO (~4 segundos vs ~6 segundos)
      // Reducimos el intervalo de polling para obtener resultados más rápido
      int attempts = 0;
      const maxAttempts = 15; // Aumentado ligeramente por precaución
      const pollInterval = Duration(milliseconds: 500); // Más frecuente

      while (attempts < maxAttempts) {
        final statusResponse = await _dio.get('/predictions/$predictionId');
        final status = statusResponse.data;

        if (status['status'] == 'succeeded') {
          // ✅ NOTA: z-image-turbo retorna la imagen directamente
          // El campo 'output' contiene la URL de la imagen
          return status['output'] as String;
        } else if (status['status'] == 'failed') {
          throw Exception('Image generation failed: ${status['error']}');
        }

        attempts++;
        await Future.delayed(pollInterval);
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

  // ✅ SIMPLIFICADO: Solo retorna el estilo del prompt
  // guidance_scale ya no se usa (siempre es 0.0 para turbo models)
  String _getStylePrompt(OpenAIImageStyle style) {
    switch (style) {
      case OpenAIImageStyle.natural:
        return 'realistic style, natural lighting, soft shadows, photorealistic details, balanced colors, authentic atmosphere';

      case OpenAIImageStyle.vivid:
        return 'vivid colors, enhanced contrast, dramatic lighting, high saturation, vibrant atmosphere, bold composition, eye-catching, dynamic scene';
    }
  }
}

// ✅ COMPARATIVA DE RENDIMIENTO Y COSTES:
// 
// TURBO-ENIGMA (anterior):
// - Coste: $0.0058 por imagen (896×504)
// - Tiempo: ~6 segundos
// - Hardware: Nvidia L40S
// - Parámetros especiales: faceswap
// 
// Z-IMAGE-TURBO (nuevo):
// - Coste: $0.0025 por imagen (896×504 = 0.45 MP) ✅ 57% más barato
// - Tiempo: ~4 segundos ✅ 33% más rápido
// - Hardware: Nvidia H100 (más potente)
// - Ventajas: Mejor calidad fotorealista, renderizado de texto bilingüe
// 
// AHORRO POR IMAGEN: $0.0033 (57%)
// Si generas 1000 imágenes al mes: Ahorro de $3.30/mes
// Si generas 10000 imágenes al mes: Ahorro de $33/mes
//
// ✅ RECOMENDACIÓN DE RESOLUCIONES POR TIER:
// 
// TIER 1 - $0.0025 (hasta 0.5 MP):
// - 704 × 704 (cuadrado): 495,616 pixels ✅ Mejor para posts de redes sociales
// - 896 × 504 (16:9 wide): 451,584 pixels ✅ Mejor para banners/headers
// - 768 × 640 (16:10): 491,520 pixels ✅ Balance entre ancho y alto
// 
// TIER 2 - $0.005 (hasta 1 MP):
// - 1024 × 1024 (cuadrado): 1,048,576 pixels ✅ Alta calidad general
// - 1280 × 720 (16:9 HD): 921,600 pixels ✅ Formato video/presentación
// - 1152 × 864 (4:3): 995,328 pixels ✅ Formato clásico
// 
// TIER 3 - $0.01 (hasta 2 MP):
// - 1536 × 1024 (3:2): 1,572,864 pixels ✅ Fotografía profesional
// - 1920 × 1080 (Full HD): 2,073,600 pixels ⚠️ Sobrepasa 2MP, usar 1440×1080



/// DEPRECATED REPLICATESERVICE - MIGRADO A TURBO ENIGMA, SE DEJA EL CÓDIGO POR SI QUEDAN COSAS ÚTILES PARA FUTURAS FUNCIONALIDADES RELACIONADAS CON IMÁGENES O AI PROMOS EN GENERAL
// class ReplicateService {
//   static final Dio _dio = Dio();
//   static const _baseUrl = 'https://api.replicate.com/v1';
//   static const _modelVersion = 'd782a412563ca745fddce97c26ff3e72c551deba88a835188374a8a3ab9b43cc';
//   static final _replicateApiKey = di<BaseConfig>().replicateApiKey;
//   static final _logger = di<Logger>();
//   static const _imageWidth = 896;
//   static const _imageHeight = 504;

//   ReplicateService() {
//     _dio.options.baseUrl = _baseUrl;
//     _dio.options.headers = {
//       'Authorization': 'Bearer $_replicateApiKey',
//       'Content-Type': 'application/json',
//       'Prefer': 'wait',
//     };
//   }

//   Future<String> generateImage(
//     String prompt,
//     String businessName,
//     OpenAIImageStyle style,
//   ) async {
//     try {
//       final (guidanceScale, stylePrompt) = _getStyleParameters(style);

//       final promptText =
//           '''Professional promotional photograph for $businessName: $prompt, high quality and definition commercial photography, professional lighting, advertisement style. CRITICAL REQUIREMENTS:
//           - ABSOLUTELY NO text, words, numbers, or character symbols included in the image
//           - WIDE format only (16:9 landscape)
//           - Professional advertising quality''';

//       final predictionResponse = await _dio.post(
//         '/predictions',
//         data: {
//           'version': _modelVersion,
//           'input': {
//             'prompt': promptText,
//             'width': _imageWidth,
//             'height': _imageHeight,
//             'num_inference_steps': 7,
//             'num_refine_steps': 5,
//             'guidance_scale': guidanceScale,
//             'faceswap_fast': true,
//             'faceswap_slow': false,
//             'save_embeddings': false,
//           },
//         },
//       );

//       if (predictionResponse.statusCode != 201) {
//         _logger.e('Error Response: ${predictionResponse.data}');
//         throw DioException(
//           requestOptions: predictionResponse.requestOptions,
//           message: 'Failed to create prediction: ${predictionResponse.data}',
//         );
//       }

//       final predictionId = predictionResponse.data['id'] as String;

//       // Polling con timeout
//       int attempts = 0;
//       const maxAttempts = 10;

//       while (attempts < maxAttempts) {
//         final statusResponse = await _dio.get('/predictions/$predictionId');

//         final status = statusResponse.data;

//         if (status['status'] == 'succeeded') {
//           return status['output'] as String;
//         } else if (status['status'] == 'failed') {
//           throw Exception('Image generation failed: ${status['error']}');
//         }

//         attempts++;
//         await Future.delayed(const Duration(seconds: 1));
//       }

//       throw Exception('Timeout waiting for image generation');
//     } on DioException catch (e) {
//       _logger.e('Dio Error: ${e.response?.data}');
//       throw Exception('Failed to generate image: ${e.message}');
//     }
//   }

//   Future<Uint8List> downloadImage(String imageUrl) async {
//     try {
//       final response = await _dio.get<List<int>>(
//         imageUrl,
//         options: Options(
//           responseType: ResponseType.bytes,
//           headers: {}, // Limpiamos los headers para la descarga de la imagen
//         ),
//       );

//       if (response.statusCode != 200) {
//         throw DioException(
//           requestOptions: response.requestOptions,
//           message: 'Failed to download image: ${response.statusCode}',
//         );
//       }

//       return Uint8List.fromList(response.data!);
//     } on DioException catch (e) {
//       throw Exception('Failed to download image: ${e.message}');
//     }
//   }

//   (double, String) _getStyleParameters(OpenAIImageStyle style) {
//     switch (style) {
//       case OpenAIImageStyle.natural:
//         return (
//           1.77, // guidance_scale estándar para un look más natural
//           'realistic style, natural lighting, photorealistic details'
//         );
//       case OpenAIImageStyle.vivid:
//         return (
//           2.5, // guidance_scale más alto para colores más vibrantes
//           'vivid colors, enhanced contrast, dramatic lighting, high saturation, vibrant and eye-catching'
//         );
//     }
//   }
// }
