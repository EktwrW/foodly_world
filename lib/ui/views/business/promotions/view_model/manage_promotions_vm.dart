import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/promotions/ai_promo_generation_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

export 'package:foodly_world/data_models/promotions/promotion_dm.dart';

part 'manage_promotions_vm.freezed.dart';

enum PromotionEditing {
  none,
  title,
  subtitle,
  description,
  start,
  expiry,
  days,
  prices,
  media,
  generateWithIA;

  bool get isEditingTitle => this == title;
  bool get isEditingSubtitle => this == subtitle;
  bool get isEditingDescription => this == description;
  bool get isEditingStart => this == start;
  bool get isEditingExpiry => this == expiry;
  bool get isEditingDays => this == days;
  bool get isEditingPrices => this == prices;
  bool get isEditingMedia => this == media;
  bool get isEditingGenerateWithIA => this == generateWithIA;
  bool get isNone => this == none;
}

@freezed
abstract class ManagePromotionsVM with _$ManagePromotionsVM {
  const ManagePromotionsVM._();

  const factory ManagePromotionsVM({
    @Default(PromotionEditing.none) PromotionEditing editing,
    @Default([]) List<PromotionDM> promotions,
    InputController? titleCtrl,
    InputController? subtitleCtrl,
    InputController? descriptionCtrl,
    InputController? promptCtrl,
    TextEditingController? youtubeUrlCtrl,
    GlobalKey<FormState>? youtubeUrlFormKey,
    @Default({}) Map<int, bool> activeDays,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    PromotionDM? newPromo,
    BusinessDM? businessDM,
    @Default(0) int indexView,
    PageController? controller,
    (String, MediaType)? newPromoMediaPath,
    Uint8List? imageBytes,

    /// Las tres artes que devolvió la última generación con IA. Vive en el VM
    /// y no en el estado porque el selector tiene que sobrevivir a los rebuilds
    /// mientras el manager compara y edita el resto del formulario.
    /// Se limpia al guardar o al subir una foto propia.
    @Default([]) List<AiPromoImageOption> aiImageOptions,

    /// Índice dentro de [aiImageOptions] de la que está aplicada.
    @Default(0) int selectedAiImageIndex,
    VideoPlayerController? videoController,
    ScrollController? activePromosScrollController,
    ScrollController? upcomingPromosScrollController,
  }) = _PromotionsVM;

  String get businessLogo => businessDM?.logo ?? '';

  bool get loggedUserCanEdit =>
      di<AuthSessionService>().userSessionDM?.user.business.any((b) => b.uuid == businessDM?.uuid) ?? false;
  bool get isEditing => editing != PromotionEditing.none;
  bool get hasInvalidDates {
    if (newPromo?.startDate == null || newPromo?.expireDate == null) return false;
    return newPromo!.startDate.isAfter(newPromo!.expireDate);
  }

  bool get isOnlyImageUpdate {
    if (newPromo == null) return false;

    return titleCtrl?.text == newPromo!.title &&
        subtitleCtrl?.text == newPromo!.subTitle &&
        descriptionCtrl?.text == newPromo!.description &&
        newPromo!.startDate.toIso8601String() == newPromo!.startDate.toIso8601String() &&
        newPromo!.expireDate.toIso8601String() == newPromo!.expireDate.toIso8601String() &&
        newPromo!.versions == newPromo!.versions &&
        newPromo!.prices == newPromo!.prices &&
        newPromo!.promoDays == newPromo!.promoDays &&
        (newPromoMediaPath != null || imageBytes != null && !newPromo!.mediaFileIsExternalLink);
  }

  bool get hasMediaContent =>
      (youtubeUrlCtrl?.text.isNotEmpty ?? false) ||
      imageBytes != null ||
      (newPromoMediaPath?.$1.isNotEmpty ?? false) ||
      (newPromo?.promoMedia.isNotEmpty ?? false);

  bool get canSavePromotion =>
      ((titleCtrl?.text?.isNotEmpty ?? false)) &&
      ((subtitleCtrl?.text?.isNotEmpty ?? false)) &&
      ((descriptionCtrl?.text?.isNotEmpty ?? false)) &&
      newPromo?.startDate != null &&
      newPromo?.expireDate != null;

  List<PromotionDM> promotionsForRender(PromotionStatus status) {
    return switch (status) {
      PromotionStatus.next => upcomingPromotions,
      PromotionStatus.active => activePromotions,
      PromotionStatus.expired => expiredPromotions,
    };
  }

  List<PromotionDM> get upcomingPromotions {
    final now = DateTime.now();
    return sortedPromotions.where((promo) => promo.startDate.isAfter(now)).toList();
  }

  List<PromotionDM> get activePromotions {
    final now = DateTime.now();
    return sortedPromotions.where((promo) => promo.startDate.isBefore(now) && promo.expireDate.isAfter(now)).toList();
  }

  List<PromotionDM> get expiredPromotions {
    final now = DateTime.now();
    return sortedPromotions.where((promo) => promo.expireDate.isBefore(now)).toList();
  }

  List<PromotionDM> get sortedPromotions {
    return List<PromotionDM>.from(promotions)..sort((a, b) => b.startDate.compareTo(a.startDate));
  }

  PromotionDM? get nextUpcomingPromotion {
    return upcomingPromotions.isEmpty
        ? null
        : upcomingPromotions.reduce((a, b) => a.startDate.isBefore(b.startDate) ? a : b);
  }
}
