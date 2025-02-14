import 'dart:typed_data' show Uint8List;

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart' as itr show IterableExtension;
import 'package:dart_openai/dart_openai.dart' show OpenAIImageStyle;
import 'package:flutter/material.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_transfer_objects/promotion/promotion_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/business/promotions/view_model/promotions_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotions_cubit.freezed.dart';
part 'promotions_state.dart';

class PromotionsCubit extends Cubit<PromotionsState> {
  PromotionsVM _vm;
  final _logger = di<Logger>();
  final _businessRepo = di<BusinessRepo>();

  PromotionsCubit(
    String businessUuid,
  )   : _vm = PromotionsVM(
          promotions: [],
          controller: PageController(),
          activePromosScrollController: ScrollController(debugLabel: 'active'),
          upcomingPromosScrollController: ScrollController(debugLabel: 'upcoming'),
        ),
        super(const PromotionsState.initial(PromotionsVM())) {
    _initializePromos();
  }

  void _initializePromos() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    await _businessRepo.getBusinessPromotions().then((result) {
      result.when(
        success: (promotions) => emit(_Loaded(_vm = _vm.copyWith(
            promotions: promotions,
            businessDM: itr.IterableExtension(promotions).firstWhereOrNull((p) => p.business != null)?.business))),
        failure: (e) => _handleError(e.errorMsg),
      );
    });
  }

  void setControllers({PromotionDM? promo}) {
    _vm = _vm.copyWith(
      titleCtrl: InputController(
        controller: TextEditingController(text: promo?.title),
        focusNode: FocusNode(),
      ),
      subtitleCtrl: InputController(
        controller: TextEditingController(text: promo?.subTitle),
        focusNode: FocusNode(),
      ),
      descriptionCtrl: InputController(
        controller: TextEditingController(text: promo?.description),
        focusNode: FocusNode(),
      ),
      promptCtrl: InputController(controller: TextEditingController(), focusNode: FocusNode()),
      newPromo: promo,
      youtubeUrlCtrl: TextEditingController(),
      youtubeUrlFormKey: GlobalKey<FormState>(),
    );
  }

  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));

  void updateEditMode(PromotionEditing mode) async {
    if (mode.isNone) {
      _vm = _vm.copyWith(
        newPromo: null,
        newPromoMediaPath: null,
        youtubeUrlCtrl: null,
        youtubeUrlFormKey: null,
        imageBytes: null,
      );
    }
    emit(_Loaded(_vm = _vm.copyWith(editing: mode)));
  }

  void updatePromoDate(DateTime? date, {required bool isStartDate}) {
    if (date == null) return;

    final currentPromo = _vm.newPromo;
    if (currentPromo == null) {
      _vm = _vm.copyWith(
        newPromo: PromotionDM(
          id: 0,
          uuid: '',
          title: '',
          description: '',
          startDate: isStartDate ? date : DateTime.now(),
          expireDate: isStartDate ? date.add(const Duration(days: 1)) : date,
          business: const BusinessDM(),
          versions: [],
          prices: const Prices(),
          promoMedia: [],
          promoDays: const PromoDaysDM(),
        ),
      );
    } else {
      _vm = _vm.copyWith(
        newPromo: currentPromo.copyWith(
          startDate: isStartDate ? date : currentPromo.startDate,
          expireDate: isStartDate ? currentPromo.expireDate : date,
        ),
      );
    }

    emit(_Loaded(_vm));
  }

  void updateActiveDay(int dayIndex, bool isActive) {
    final newActiveDays = Map<int, bool>.from(_vm.activeDays);
    newActiveDays[dayIndex] = isActive;
    _vm = _vm.copyWith(activeDays: newActiveDays);
    emit(_Loaded(_vm));
  }

  void updatePromoDays(Set<Weekday> selectedDays) {
    final currentPromo = _vm.newPromo;
    if (currentPromo == null) return;

    final updatedDays = PromoDaysDM(
      sunday: selectedDays.contains(Weekday.sunday),
      monday: selectedDays.contains(Weekday.monday),
      tuesday: selectedDays.contains(Weekday.tuesday),
      wednesday: selectedDays.contains(Weekday.wednesday),
      thursday: selectedDays.contains(Weekday.thursday),
      friday: selectedDays.contains(Weekday.friday),
      saturday: selectedDays.contains(Weekday.saturday),
    );

    _vm = _vm.copyWith(newPromo: currentPromo.copyWith(promoDays: updatedDays));

    emit(_Loaded(_vm));
  }

  void clearVideoController() {
    _vm = _vm.copyWith(videoController: null);
    emit(_Loaded(_vm));
  }

  void attachYoutubeUrl() async {
    _vm = _vm.copyWith(newPromo: _vm.newPromo?.copyWith(mediaLink: _vm.youtubeUrlCtrl?.text));
    await Future.microtask(() => emit(_Loaded(_vm)));
  }

  void updatePromoMediaPath((String, MediaType) path) async {
    if (_vm.videoController != null) {
      await _vm.videoController!.dispose();
    }

    _vm = _vm.copyWith(
      newPromoMediaPath: path,
      imageBytes: null, // Clear any AI generated image
      videoController: null, // Ensure we clear the video controller
    );
    _vm.youtubeUrlCtrl?.clear();

    emit(_Loaded(_vm));
  }

  void clearPromoMedia() {
    _vm = _vm.copyWith(
      newPromoMediaPath: null,
      imageBytes: null,
    );
    emit(_Loaded(_vm));
  }

  void updateImageBytes(Uint8List bytes) {
    _vm = _vm.copyWith(
      imageBytes: bytes,
      newPromoMediaPath: null, // Clear any picked image path
    );
    emit(_Loaded(_vm));
  }

  void generatePromotion({required (bool, OpenAIImageStyle) generateImage}) async {
    try {
      emit(_Loading(_vm));

      if (_vm.businessDM == null) {
        _handleError(S.current.businessInformationNotFound);
        return;
      }

      if (_vm.promptCtrl?.text?.isEmpty ?? true) {
        _handleError(S.current.internalErrorEmptyPrompt);
        return;
      }

      final response = await di<AIPromoService>().generatePromotion(
        _vm.promptCtrl?.text ?? '',
        businessName: _vm.businessDM!.name ?? '',
        businessUuid: _vm.businessDM!.uuid,
        generateImage: generateImage,
      );

      _vm.titleCtrl?.controller?.text = response.title;
      _vm.subtitleCtrl?.controller?.text = response.subtitle;
      _vm.descriptionCtrl?.controller?.text = response.description;

      if (generateImage.$1 && response.imageBytes != null) {
        updateImageBytes(response.imageBytes!);
      }

      emit(_Loaded(_vm));
    } catch (e) {
      _handleError(e);
    }
  }

  void createPromotion() async {
    if (!_vm.canSavePromotion) {
      _vm = _vm.copyWith(autovalidateMode: AutovalidateMode.always);
      emit(_Loaded(_vm));
      return;
    }

    if (_vm.newPromo == null || _vm.businessDM == null) {
      _handleError(S.current.incompletePromotionCreateInfo);
      return;
    }

    emit(_Loading(_vm));

    final promotionDTO = PromotionDTO(
      businessUuid: _vm.businessDM!.uuid,
      title: _vm.titleCtrl?.text ?? '',
      subTitle: _vm.subtitleCtrl?.text,
      description: _vm.descriptionCtrl?.text,
      startDate: _vm.newPromo!.startDate.toIso8601String(),
      expireDate: _vm.newPromo!.expireDate.toIso8601String(),
      versions: _vm.newPromo!.versions,
      prices: _vm.newPromo!.prices,
      promoActiveDays: _vm.newPromo!.promoDays,
      available: true,
      mediaLink: _vm.newPromo?.mediaLink,
    );

    await _businessRepo.createPromotion(promotionDTO).then((result) {
      result.when(
        success: (promotion) async {
          if (_vm.imageBytes != null && !promotion.mediaFileIsExternalLink) {
            await _businessRepo.storePromotionMedia(
              filePaths: [],
              promotionUuid: promotion.uuid,
              imageBytes: _vm.imageBytes,
            ).then(
              (result) => result.when(
                success: (response) => promotion = promotion.copyWith(promoMedia: response.promoMedia),
                failure: (e) => _handleError('${S.current.errorUploadingPromotionMedia}: ${e.errorMsg}'),
              ),
            );
          }

          if (_vm.newPromoMediaPath?.$1 != null && !promotion.mediaFileIsExternalLink) {
            await _businessRepo.storePromotionMedia(
              filePaths: [_vm.newPromoMediaPath!.$1],
              promotionUuid: promotion.uuid,
            ).then(
              (result) => result.when(
                success: (response) => promotion = promotion.copyWith(promoMedia: response.promoMedia),
                failure: (e) => _handleError('${S.current.errorUploadingPromotionMedia}: ${e.errorMsg}'),
              ),
            );
          }

          final updatedPromotions = [..._vm.promotions, promotion];
          _vm = _vm.copyWith(
            promotions: updatedPromotions,
            newPromo: null,
            newPromoMediaPath: null,
            imageBytes: null,
            editing: PromotionEditing.none,
          );

          await _updateScrollPositionForActivePromo(promotion);

          emit(_Loaded(_vm));
        },
        failure: (error) => _handleError(error.errorMsg),
      );
    });
  }

  Future<void> _updateScrollPositionForActivePromo(PromotionDM promotion) async {
    if (promotion.isActive) {
      await _vm.controller?.animateToPage(0, duration: Durations.long2, curve: Curves.decelerate).then((_) async {
        await Future.microtask(() {
          if (_vm.activePromosScrollController?.hasClients ?? false) {
            _vm.activePromosScrollController?.animateTo(
              0,
              duration: Durations.long1,
              curve: Curves.decelerate,
            );
          }
        });
      });

      updateView(0);
    }

    if (promotion.isUpcoming) {
      emit(_Loaded(_vm));

      await Future.delayed(Durations.medium1, () {
        if (_vm.upcomingPromosScrollController?.hasClients ?? false) {
          _vm.upcomingPromosScrollController?.animateTo(
            0,
            duration: Durations.long1,
            curve: Curves.decelerate,
          );
        }
      });
    }
  }

  void updatePromotion() async {
    if (!_vm.canSavePromotion) {
      _vm = _vm.copyWith(autovalidateMode: AutovalidateMode.always);
      emit(_Loaded(_vm));
      return;
    }

    if (_vm.newPromo == null || _vm.businessDM == null) {
      _handleError(S.current.incompletePromotionUpdateInfo);
      return;
    }

    emit(_Loading(_vm));

    if (_vm.isOnlyImageUpdate) {
      await _updatePromotionImage(_vm.newPromo!);
    } else {
      // Si hay cambios en el texto, actualizar todo
      await _updateFullPromotion();
    }
  }

  Future<void> _updatePromotionImage(PromotionDM promotion) async {
    if (_vm.imageBytes == null && _vm.newPromoMediaPath == null) return;

    final hasExistingMedia = promotion.promoMedia.isNotEmpty && promotion.promoMedia.first.uuid.isNotEmpty;
    final result = hasExistingMedia
        ? await _businessRepo.updatePromotionMedia(
            filePaths: [_vm.newPromoMediaPath!.$1],
            uuid: promotion.promoMedia.first.uuid,
            imageBytes: _vm.imageBytes,
          )
        : await _businessRepo.storePromotionMedia(
            promotionUuid: promotion.uuid,
            filePaths: [_vm.newPromoMediaPath!.$1],
            imageBytes: _vm.imageBytes,
          );

    result.when(
      success: (response) => _handleSuccessfulMediaUpdate(
        promotion: promotion,
        response: response,
      ),
      failure: (e) => _handleError('${S.current.errorUploadingPromotionMedia}: ${e.errorMsg}'),
    );
  }

  Future<void> _handleSuccessfulMediaUpdate({
    required PromotionDM promotion,
    required dynamic response,
  }) async {
    if (!promotion.mediaFileIsExternalLink) {
      final updatedPromotion = promotion.copyWith(
        promoMedia: response is PromoMediaDM ? [response] : response.promoMedia,
      );

      _updateStateAfterSuccess(updatedPromotion);
      return;
    }

    final cleaningResult = await _businessRepo.updatePromotion(
      uuid: promotion.uuid,
      body: const PromotionDTO(mediaLink: ''),
    );

    cleaningResult.when(
      success: (cleanedPromo) {
        final updatedPromotion = promotion.copyWith(
          promoMedia: response is PromoMediaDM ? [response] : cleanedPromo.promoMedia,
        );
        _updateStateAfterSuccess(updatedPromotion);
      },
      failure: (e) => _handleError('${S.current.errorUploadingPromotionMedia}: ${e.errorMsg}'),
    );
  }

  Future<void> _updateFullPromotion() async {
    final promotionDTO = PromotionDTO(
      businessUuid: _vm.businessDM!.uuid,
      title: _vm.titleCtrl?.text ?? '',
      subTitle: _vm.subtitleCtrl?.text,
      description: _vm.descriptionCtrl?.text,
      startDate: _vm.newPromo!.startDate.toIso8601String(),
      expireDate: _vm.newPromo!.expireDate.toIso8601String(),
      versions: _vm.newPromo!.versions,
      prices: _vm.newPromo!.prices,
      promoActiveDays: _vm.newPromo!.promoDays,
      available: true,
      mediaLink: _vm.newPromo!.mediaLink,
    );

    await _businessRepo.updatePromotion(uuid: _vm.newPromo!.uuid, body: promotionDTO).then((result) {
      result.when(
        success: (promotion) async {
          if (_vm.newPromoMediaPath != null || _vm.imageBytes != null) {
            await _updatePromotionImage(promotion);
          } else {
            await _updateStateAfterSuccess(promotion);
          }
          await _updateScrollPositionForActivePromo(promotion);
        },
        failure: (error) => _handleError(error.errorMsg),
      );
    });
  }

  Future<void> _updateStateAfterSuccess(PromotionDM promotion) async {
    final updatedPromotions = _vm.promotions.map((p) => p.uuid == promotion.uuid ? promotion : p).toList();
    _vm.youtubeUrlCtrl?.clear();
    _vm = _vm.copyWith(
      promotions: updatedPromotions,
      newPromo: null,
      newPromoMediaPath: null,
      imageBytes: null,
      editing: PromotionEditing.none,
    );

    emit(_Loaded(_vm));
  }

  void deletePromotion(String uuid) async {
    emit(_Loading(_vm));

    await _businessRepo.deletePromotion(uuid).then((result) {
      result.when(
        success: (_) async {
          final updatedPromotions = _vm.promotions.whereNot((p) => p.uuid == uuid).toList();

          _vm = _vm.copyWith(
            promotions: updatedPromotions,
            newPromo: null,
            newPromoMediaPath: null,
            imageBytes: null,
            editing: PromotionEditing.none,
          );

          emit(_Loaded(_vm));
        },
        failure: (error) => _handleError(error.errorMsg),
      );
    });
  }

  void _handleError(Object e) {
    _logger.e(e);
    emit(_Error(e.toString(), _vm));
  }
}
