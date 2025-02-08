import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:dart_openai/dart_openai.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';

class AIPromoService {
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
        temperature: 0.7,
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
        final imageResponse = await OpenAI.instance.image.create(
          prompt: '''Generate a 16:9 wide promotional photograph for $businessName:
          Subject: $prompt
          CRITICAL REQUIREMENTS:
          - ABSOLUTELY NO text, words, numbers, or symbols included in the image
          - WIDE format only (16:9 landscape)
          - Photographic style marketing image only
          - Professional advertising quality''',
          n: 1,
          size: OpenAIImageSize.size1792Horizontal,
          model: FoodlyStrings.DALL_E_3,
          quality: OpenAIImageQuality.hd,
          style: generateImage.$2,
          responseFormat: OpenAIImageResponseFormat.b64Json,
          user: '$businessName:$businessUuid',
        );

        final b64Json = imageResponse.data.first.b64Json;
        if (b64Json == null) {
          throw Exception('Failed to generate promotion image: Image data is null');
        }
        imageBytes = base64Decode(b64Json);
      }

      // Validar límites de caracteres
      final title = jsonResponse['title'] as String;
      final subtitle = jsonResponse['subtitle'] as String;
      final description = jsonResponse['description'] as String;

      if (title.length > 36 || subtitle.length > 99 || description.length > 369) {
        throw Exception('Generated content by AI exceeds character limits, please try again.');
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
