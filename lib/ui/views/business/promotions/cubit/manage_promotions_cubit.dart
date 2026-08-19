import 'package:collection/collection.dart' as itr show IterableExtension;
import 'package:foodly_world/core/enums/promo_art_context_enum.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/promotions/ai_promo_generation_dm.dart';
import 'package:foodly_world/data_transfer_objects/promotion/promotion_dto.dart';
import 'package:foodly_world/ui/views/business/promotions/view_model/manage_promotions_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_promotions_cubit.freezed.dart';
part 'manage_promotions_state.dart';

class ManagePromotionsCubit extends Cubit<ManagePromotionsState> {
  ManagePromotionsVM _vm;
  final Logger _logger;
  final BusinessRepo _businessRepo;
  final AuthSessionService _authSessionService;
  final String _businessUuid;

  ManagePromotionsCubit(
    String businessUuid,
    BusinessRepo businessRepo,
    Logger logger,
    BusinessDM? businessDM,
    AuthSessionService authSessionService,
  )   : _vm = ManagePromotionsVM(
          promotions: [],
          controller: PageController(),
          activePromosScrollController: ScrollController(debugLabel: 'active'),
          upcomingPromosScrollController: ScrollController(debugLabel: 'upcoming'),
          businessDM: businessDM,
        ),
        _logger = logger,
        _businessRepo = businessRepo,
        _authSessionService = authSessionService,
        _businessUuid = businessUuid,
        super(const ManagePromotionsState.initial(ManagePromotionsVM())) {
    _initializePromos();
  }

  void _initializePromos() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    await _businessRepo.getBusinessPromotions().then((result) {
      result.when(
        success: (promotions) {
          BusinessDM? business;

          if (_vm.businessDM == null) {
            business = itr.IterableExtension(promotions).firstWhereOrNull((p) => p.business != null)?.business;

            if (business != null) {
              _vm = _vm.copyWith(businessDM: business);
            } else {
              business = itr.IterableExtension(_authSessionService.userSessionDM?.user.business ?? []).firstWhereOrNull(
                (b) => b.uuid == _businessUuid,
              );
              _vm = _vm.copyWith(businessDM: business);
            }
          }

          emit(_Loaded(_vm = _vm.copyWith(
              promotions: promotions,
              businessDM: _vm.businessDM ??
                  itr.IterableExtension(promotions).firstWhereOrNull((p) => p.business != null)?.business)));
        },
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

  /// Borra la foto actual de la promo en el backend y la saca de la vista.
  ///
  /// El item "Eliminar fotos" del menú llamaba a `_editImage()`, que sólo
  /// abría el selector de imágenes: nunca borraba nada. Quien quería sacar la
  /// foto terminaba obligado a elegir otra.
  ///
  /// Emite `loading` mientras el backend confirma, así el editor puede mostrar
  /// el iso de carga en lugar de la foto — sin eso el borrado se siente
  /// instantáneo y engañoso, porque la imagen desaparecería antes de que el
  /// servidor la haya borrado de verdad.
  Future<void> deletePromoMedia() async {
    final promo = _vm.newPromo;

    // Enlace externo (YouTube): no hay archivo en storage. El enlace es una
    // columna de la promo, así que se limpia por otro camino.
    if (promo?.mediaFileIsExternalLink ?? false) {
      await _deletePromoExternalLink(promo!);
      return;
    }

    final persisted = promo?.promoMedia ?? const [];
    final media = persisted.isNotEmpty ? persisted.first : null;

    // Sin media persistida no hay nada que borrar en el servidor: es una
    // imagen recién generada o recién elegida que todavía vive sólo en el VM.
    if (media == null) {
      clearPromoMedia();
      return;
    }

    emit(_Loading(_vm));

    final result = await _businessRepo.deletePromotionMedia(media.uuid);

    result.when(
      success: (_) {
        _vm = _vm.copyWith(
          newPromo: _vm.newPromo?.copyWith(promoMedia: const []),
          newPromoMediaPath: null,
          imageBytes: null,
          aiImageOptions: const [],
          selectedAiImageIndex: 0,
        );
        emit(_Loaded(_vm));
      },
      failure: (e) {
        _logger.e('Promo media delete failed: $e');
        _handleError(e);
      },
    );
  }

  /// Quita el enlace de YouTube de una promo.
  ///
  /// No pasa por `DELETE /promotions-media`: un enlace externo no tiene
  /// archivo en nuestro storage, vive en la columna `media_link` de la propia
  /// promoción. Se limpia con un `updatePromotion`.
  ///
  /// **Se manda string vacío y no `null` a propósito.** `PromotionDTO` omite
  /// del JSON los campos nulos (`if (instance.mediaLink case final value?)` en
  /// el `.g.dart`), y el backend hace `$promotion->update($request->validated())`:
  /// un campo ausente deja la columna intacta. Con `null` el enlace sobreviviría
  /// al borrado. Con `''` el campo viaja, pasa la validación `nullable|string`
  /// y la columna queda vacía — que es lo que `mediaFileIsExternalLink` lee.
  Future<void> _deletePromoExternalLink(PromotionDM promo) async {
    // El editor también mira el controller para decidir si renderiza el
    // player, así que limpiarlo es parte del borrado y no un detalle de UI.
    _vm.youtubeUrlCtrl?.clear();

    // Promo todavía no creada en el servidor: alcanza con limpiar el VM.
    if (promo.uuid.isEmpty || _vm.businessDM == null) {
      _vm = _vm.copyWith(newPromo: promo.copyWith(mediaLink: null));
      emit(_Loaded(_vm));
      return;
    }

    emit(_Loading(_vm));

    final result = await _businessRepo.updatePromotion(
      uuid: promo.uuid,
      body: PromotionDTO(
        businessUuid: _vm.businessDM!.uuid,
        title: _vm.titleCtrl?.text ?? promo.title,
        subTitle: _vm.subtitleCtrl?.text ?? promo.subTitle,
        description: _vm.descriptionCtrl?.text ?? promo.description,
        startDate: promo.startDate.toIso8601String(),
        expireDate: promo.expireDate.toIso8601String(),
        versions: promo.versions,
        prices: promo.prices,
        promoActiveDays: promo.promoDays,
        available: true,
        mediaLink: '',
      ),
    );

    result.when(
      success: (updated) {
        _vm = _vm.copyWith(
          newPromo: updated.copyWith(mediaLink: null),
          newPromoMediaPath: null,
          imageBytes: null,
          aiImageOptions: const [],
          selectedAiImageIndex: 0,
        );
        emit(_Loaded(_vm));
      },
      failure: (e) {
        _logger.e('Promo youtube link delete failed: $e');
        _handleError(e);
      },
    );
  }

  void clearPromoMedia() {
    _vm = _vm.copyWith(
      newPromoMediaPath: null,
      imageBytes: null,
    );
    emit(_Loaded(_vm));
  }

  /// Genera copy + imagen de la promo llamando al BE.
  ///
  /// Antes esto hacía tres cosas desde el cliente: pegarle a
  /// `/promotions/ai-quota-use`, después al proveedor de texto y después al
  /// de imagen, con las dos API keys compiladas dentro del binario.
  /// Ahora es un solo
  /// round-trip a `/promotions/ai-generate` y las credenciales viven en
  /// Cloud Run.
  ///
  /// El chequeo de cuota también dejó de ser fail-open: antes, si la llamada
  /// de cuota fallaba, el cubit generaba igual "para no bloquear al usuario",
  /// lo que convertía el límite de 6/mes en decorativo. Ahora el límite lo
  /// aplica el BE en la misma transacción que genera.
  void generatePromotion({required AiPromoImageOptions options}) async {
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

      final result = await _businessRepo.generateAiPromo(
        businessUuid: _businessUuid,
        prompt: _vm.promptCtrl?.text ?? '',
        generateImage: options.generate,
        style: options.style,
        artContext: options.context,
        includePeople: options.people,
        locale: _authSessionService.lang,
      );

      result.when(
        success: (AiPromoGenerationResponse response) {
          // Refrescar la cuota local con lo que devolvió el BE.
          _vm = _vm.copyWith(
            businessDM: _vm.businessDM?.copyWith(
              aiPromoMonthlyLimit: response.aiPromoMonthlyLimit,
              aiPromosUsedThisMonth: response.aiPromosUsedThisMonth,
            ),
          );

          if (!response.granted) {
            emit(_AiQuotaExhausted(_vm));
            return;
          }

          _vm.titleCtrl?.controller?.text = response.title;
          _vm.subtitleCtrl?.controller?.text = response.subtitle;
          _vm.descriptionCtrl?.controller?.text = response.description;

          // Las imágenes son best-effort: si Replicate falló, el BE devuelve
          // el copy igual y la lista viene vacía. En ese caso dejamos los
          // textos y el manager sube su propia foto.
          final images = response.usableImages;
          if (images.isNotEmpty) {
            _vm = _vm.copyWith(
              aiImageOptions: images,
              selectedAiImageIndex: 0,
              newPromoMediaPath: null,
              imageBytes: images.first.bytes,
            );
          }
          emit(_Loaded(_vm));
        },
        failure: (e) {
          _logger.e('AI promo generation failed: $e');
          _handleError(e);
        },
      );
    } catch (e) {
      _handleError(e);
    }
  }

  /// Aplica una de las artes generadas. No vuelve a pegarle al BE: las tres
  /// ya vinieron en el mismo round-trip, así que cambiar de opción es gratis
  /// e instantáneo.
  void selectAiImage(int index) {
    final options = _vm.aiImageOptions;
    if (index < 0 || index >= options.length) return;

    final bytes = options[index].bytes;
    if (bytes == null) return;

    _vm = _vm.copyWith(
      selectedAiImageIndex: index,
      imageBytes: bytes,
      newPromoMediaPath: null,
    );
    emit(_Loaded(_vm));
  }

  /// Descarta el selector. Se llama cuando el manager sube su propia foto o
  /// borra la media: a partir de ahí las opciones de IA ya no aplican.
  void clearAiImageOptions() {
    if (_vm.aiImageOptions.isEmpty) return;
    _vm = _vm.copyWith(aiImageOptions: const [], selectedAiImageIndex: 0);
    emit(_Loaded(_vm));
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
      await _vm.controller?.animateToPage(0, duration: Durations.short4, curve: Curves.decelerate).then((_) async {
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
