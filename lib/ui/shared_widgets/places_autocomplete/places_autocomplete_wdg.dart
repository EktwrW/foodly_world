import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/network/places_proxy/places_proxy_repo.dart';
import 'package:foodly_world/data_models/places_proxy/place_prediction_dm.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/place_autocomplete_request_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/_places_proxy_adapter.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:logger/logger.dart';
import 'package:nova_places_api/nova_places_api.dart';

class PlacesAutocompleteWdg extends StatelessWidget {
  const PlacesAutocompleteWdg({
    super.key,
    this.onPickedPlaceDetail,
    this.language,
    this.components,
    this.autofocus = false,
    this.hintText,
    this.disabled = false,
    this.textController,
    this.focusNode,
  });
  final void Function(Place)? onPickedPlaceDetail;
  final String? language;
  final List<String>? components;
  final bool autofocus;
  final String? hintText;
  final bool disabled;
  final TextEditingController? textController;
  final FocusNode? focusNode;

  static final _novaCtrl = FoodlyPlacesAutocompleteWdgController();

  @override
  Widget build(BuildContext context) {
    return FoodlyPlacesAutocompleteWdg(
      controller: _novaCtrl,
      textController: textController,
      focusNode: focusNode,
      language: language,
      apiKey: di<BaseConfig>().googleDefaultApiKey,
      onPicked: (prediction) => di<Logger>().i('$prediction'),
      onSearchFailed: (error) {
        if (error.isNotEmpty) {
          di<Logger>().e(error);
          _novaCtrl.reset();
        }
      },
      hintText: hintText ?? S.current.searchBusinessOrAddress,
      components: components,
      radius: 20,
      enabled: !disabled,
      prefixIcon: Icon(
        Bootstrap.geo_alt,
        size: 22,
        color: disabled ? ui.NeumorphicColors.disabled : FoodlyThemes.primaryFoodly,
      ).paddingBottom(6),
      cancelIcon: Icon(
        Bootstrap.eraser_fill,
        size: 22,
        color: disabled ? ui.NeumorphicColors.disabled : FoodlyThemes.primaryFoodly,
      ).paddingBottom(4),
      autocompleteOnTrailingWhitespace: true,
      detailRequired: true,
      onPickedPlaceDetail: onPickedPlaceDetail,
      autofocus: autofocus,
    );
  }
}

class FoodlyPlacesAutocompleteWdg extends StatefulWidget {
  const FoodlyPlacesAutocompleteWdg({
    super.key,
    this.debug = false,
    required this.apiKey,
    this.language = 'en',
    this.components,
    this.location,
    this.radius,
    this.offset,
    this.region,
    this.sessionToken,
    this.strictBounds,
    this.types,
    this.autofocus = false,
    this.debounceTime = 400,
    this.detailRequired = false,
    this.hintText,
    this.prefixIcon,
    this.cancelIcon,
    this.textController,
    this.focusNode,
    this.autocompleteOnTrailingWhitespace = false,
    this.spaceBetweenTextFieldAndSuggestions = 6,
    this.suggestionsBackgroundColor = Colors.white,
    this.controller,
    required this.onPicked,
    this.onPickedPlaceDetail,
    this.onSearchFailed,
    this.enabled = true,
  });

  // API parameters
  final bool debug;
  final String apiKey;
  final String? language;
  final List<String>? components;
  final LatLngLiteral? location;
  final double? radius;
  final int? offset;
  final String? region;
  final String? sessionToken;
  final bool? strictBounds;
  final List<String>? types;

  // UI parameters
  final bool autofocus;
  final bool enabled;
  final int debounceTime;
  final bool detailRequired;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? cancelIcon;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final bool autocompleteOnTrailingWhitespace;
  final double spaceBetweenTextFieldAndSuggestions;
  final Color suggestionsBackgroundColor;

  // Callbacks and controller
  final FoodlyPlacesAutocompleteWdgController? controller;
  final ValueChanged<PlaceAutocompletePrediction> onPicked;
  final ValueChanged<Place>? onPickedPlaceDetail;
  final ValueChanged<String>? onSearchFailed;

  @override
  State<FoodlyPlacesAutocompleteWdg> createState() => FoodlyPlacesAutocompleteWdgState();
}

class FoodlyPlacesAutocompleteWdgState extends State<FoodlyPlacesAutocompleteWdg> {
  /// `true` → usamos Foodly Places Proxy backend. `false` → hit directo a
  /// `nova_places_api`. Resuelto UNA vez en `initState` leyendo el cache
  /// in-memory de [AppFeaturesRepo] (nunca I/O en initState). Default seguro
  /// es `true` (proxy activo) — ver docblock de `AppFeaturesDM.placesProxyEnabled`.
  ///
  /// No reacciona a cambios en runtime del flag: si el ops-team flipa el
  /// kill-switch a false mientras el widget está montado, la instancia
  /// actual sigue con la ruta vieja. Aceptable porque el widget es de vida
  /// corta (autocompletar es "abrir pantalla → tipear → pickear → cerrar").
  late final bool _useProxy;

  /// Cliente nova legacy. Solo se inicializa cuando `_useProxy == false`;
  /// nullable para no gastar apiKey/Dio instance cuando no hace falta.
  PlacesApi? _placesApi;

  /// Repo del proxy Foodly. Solo se setea cuando `_useProxy == true` —
  /// null en la ruta legacy. Resuelto vía GetIt (ya registrado como
  /// LazySingleton en dependency_injection_service).
  PlacesProxyRepo? _proxyRepo;

  late final PlaceDebouncer _placeDebouncer;
  late final String _sessionToken;
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  late final LayerLink _link;

  OverlayEntry? _overlayEntry;
  String? _prevSearchTerm;
  final _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Lectura síncrona del cache — `cachedOrDefaults` devuelve el último
    // fetch exitoso o el AppFeaturesDM de defaults (placesProxyEnabled=true).
    // Nunca hace I/O acá; el refresh lo dispara quien corresponda en boot.
    _useProxy = di<AppFeaturesRepo>().cachedOrDefaults.placesProxyEnabled;

    if (_useProxy) {
      _proxyRepo = di<PlacesProxyRepo>();
    } else {
      _placesApi = PlacesApi(apiKey: widget.apiKey);
    }

    _placeDebouncer = PlaceDebouncer(milliseconds: widget.debounceTime);
    _sessionToken = widget.sessionToken ?? generateSessionToken();
    _textController = widget.textController ?? TextEditingController();
    _focusNode = (widget.focusNode ?? FocusNode())..addListener(_onFocusChange);
    _link = LayerLink();
    widget.controller?.attach(this);
  }

  @override
  void dispose() {
    widget.controller?.detach();
    // `_placesApi` es nullable en la ruta proxy — solo disposamos si se creó.
    _placesApi?.dispose();
    _placeDebouncer.dispose();
    _textController.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _hideOverlay();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _hideOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: ListenableBuilder(
          listenable: _focusNode,
          builder: (context, _) {
            return TextField(
              key: _textFieldKey,
              enableSuggestions: false,
              enabled: widget.enabled,
              autofocus: widget.autofocus,
              focusNode: _focusNode,
              style: const TextStyle(fontSize: 14),
              controller: _textController,
              onChanged: _onTextChange,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: widget.prefixIcon ?? const Icon(Icons.search),
                suffixIcon: GestureDetector(
                  onTap: _clearText,
                  child: widget.cancelIcon ?? const Icon(Icons.close),
                ),
                filled: true,
                fillColor: _focusNode.hasFocus ? FoodlyThemes.primaryFoodly.withValues(alpha: 0.1) : Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: .25),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: .25),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: FoodlyThemes.primaryFoodly,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: ui.NeumorphicColors.disabled,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            );
          }),
    );
  }

  void _clearText() {
    _prevSearchTerm = '';
    _textController.clear();
    _hideOverlay();
    widget.onSearchFailed?.call('');
  }

  void _resetSearchBar() {
    widget.controller?.detach();
    _hideOverlay();
  }

  void _onTextChange(String value) {
    if (value.length < 3 || !_focusNode.hasFocus) {
      _hideOverlay();
      _placeDebouncer.cancel();
      _prevSearchTerm = '';
      return;
    }

    // If the value matches our previous search term exactly, don't trigger a new search
    if (value == _prevSearchTerm) {
      _placeDebouncer.cancel();
      return;
    }

    if (!widget.autocompleteOnTrailingWhitespace && value.endsWith(' ')) {
      _placeDebouncer.cancel();
      return;
    }

    _placeDebouncer.run(() {
      _handleSearchText(value.trim());
    });
  }

  /// Dispatcher por flag. La lógica de cada rama vive en métodos separados
  /// para que el diff entre "usando nova" y "usando proxy" sea leíble en
  /// PRs y grepable por nombre cuando rollback.
  Future<void> _handleSearchText(String searchTerm) async {
    if (searchTerm.isEmpty || !_focusNode.hasFocus) {
      _hideOverlay();
      return;
    }

    _prevSearchTerm = searchTerm;

    if (_useProxy) {
      await _handleSearchViaProxy(searchTerm);
    } else {
      await _handleSearchViaNova(searchTerm);
    }
  }

  /// Ruta legacy — hit directo a Google vía `nova_places_api`. Se elimina
  /// en Fase 6 junto con el flag y el paquete. Mantenida 1:1 al
  /// comportamiento pre-migración para que el rollback sea un no-op.
  Future<void> _handleSearchViaNova(String searchTerm) async {
    try {
      final response = await _placesApi!.placeAutocomplete(
        input: searchTerm,
        language: widget.language,
        components: widget.components,
        location: widget.location,
        radius: widget.radius,
        offset: widget.offset,
        region: widget.region,
        sessionToken: _sessionToken,
        types: widget.types,
        strictBounds: widget.strictBounds,
      );

      if (!mounted) return;

      if (!response.isSuccess) {
        widget.onSearchFailed?.call(response.errorMessage ?? 'Something went wrong');
        _hideOverlay();
        return;
      }

      if (response.predictions.isEmpty) {
        _hideOverlay();
        return;
      }

      _hideOverlay();

      final overlayView = _buildPredictionsSearchingOverlay(
        context,
        response.predictions,
      );
      _showOverlay(context, overlayView);
    } catch (e) {
      if (!mounted) return;
      widget.onSearchFailed?.call(e.toString());
      _hideOverlay();
    }
  }

  /// Ruta proxy — la autocomplete pega al backend Foodly que hace el call
  /// server-to-server a Google. Diferencias observables vs nova:
  ///   - `components` acá viaja como string pipe-joined (`"country:pt|country:es"`)
  ///     porque es el shape que espera el FormRequest del backend.
  ///   - `location` viaja como string `"lat,lng"` con la misma semántica.
  ///   - Error surface: el repo envuelve todo en ApiResult, lo que nos da
  ///     un único path de failure en vez de dos (response.isSuccess==false
  ///     y throw).
  ///   - El overlay renderiza `PlacePredictionDM` directo (no se convierte
  ///     a nova.Prediction — ver docblock del adapter para el porqué).
  Future<void> _handleSearchViaProxy(String searchTerm) async {
    final dto = PlaceAutocompleteRequestDTO(
      input: searchTerm,
      language: widget.language,
      region: widget.region,
      sessionToken: _sessionToken,
      // components: nova espera `List<String>` tipo `["country:pt", ...]`.
      // El backend espera un único string pipe-joined. Si widget.components
      // es null o vacío, no mandamos la key (@JsonKey includeIfNull: false).
      components: (widget.components == null || widget.components!.isEmpty)
          ? null
          : widget.components!.join('|'),
      // location: nova toma LatLngLiteral; backend toma string "lat,lng".
      location: widget.location != null
          ? '${widget.location!.lat},${widget.location!.lng}'
          : null,
      // radius: nova acepta double, backend int (metros). Casteo seguro —
      // los valores que mandamos hoy son enteros (20, 50, etc.).
      radius: widget.radius?.toInt(),
      types: (widget.types == null || widget.types!.isEmpty) ? null : widget.types!.join('|'),
    );

    final result = await _proxyRepo!.autocomplete(dto);

    if (!mounted) return;

    result.when(
      success: (response) {
        // ZERO_RESULTS y status no-ok que no sean errores → UI limpia, sin toast.
        if (response.status.isEmpty || response.predictions.isEmpty) {
          _hideOverlay();
          return;
        }

        if (response.status.isError) {
          widget.onSearchFailed?.call('Places proxy status: ${response.status.name}');
          _hideOverlay();
          return;
        }

        _hideOverlay();

        final overlayView = _buildProxyPredictionsOverlay(
          context,
          response.predictions,
        );
        _showOverlay(context, overlayView);
      },
      failure: (failure) {
        widget.onSearchFailed?.call(failure.error.toString());
        _hideOverlay();
      },
    );
  }

  /// Overlay de la ruta legacy (nova). Intocado vs pre-migración.
  Widget _buildPredictionsSearchingOverlay(
    BuildContext context,
    List<PlaceAutocompletePrediction> predictions,
  ) {
    return PredictionListView(
      predictions: predictions,
      onPredictionSelect: (prediction) async {
        // First, hide the overlay and clear focus
        _hideOverlay();
        _focusNode.unfocus();

        // Then update the text silently (without triggering onChanged)
        _prevSearchTerm = prediction.description;
        _textController.value = TextEditingValue(
          text: prediction.description,
          selection: TextSelection.collapsed(offset: prediction.description.length),
        );

        widget.onPicked(prediction);

        if (widget.detailRequired && widget.onPickedPlaceDetail != null) {
          if (prediction.placeId == null) return;

          final resp = await _placesApi!.getPlaceDetails(
            placeId: prediction.placeId!,
            language: widget.language,
            region: widget.region,
            sessionToken: _sessionToken,
          );

          if (resp.isSuccess) {
            widget.onPickedPlaceDetail?.call(resp.result!);
          }
        }
      },
    );
  }

  /// Overlay de la ruta proxy. Renderiza `PlacePredictionDM` sin convertir
  /// a nova.PlaceAutocompletePrediction (ver docblock del adapter para el
  /// porqué). En `onPredictionSelect`:
  ///   - Hide overlay + unfocus + mirror text — idéntico a la ruta nova.
  ///   - **NO** se dispara `widget.onPicked(...)` — el callback espera un
  ///     `nova.PlaceAutocompletePrediction` con subtypes que no podemos
  ///     fabricar de forma segura desde un DM. El único consumer del
  ///     callback hoy es un logger en `PlacesAutocompleteWdg`, así que la
  ///     pérdida funcional es nula. Documentado aquí explícito para que si
  ///     un consumer nuevo lo necesita, migre primero a DM.
  ///   - Hit a `/places/details/{placeId}` via proxy con el mismo
  ///     sessionToken (billing consolidado) y language/region del widget.
  ///   - Pasa el Place resultante por `novaPlaceFromDM` para que el
  ///     callback `onPickedPlaceDetail` siga recibiendo `nova.Place` sin
  ///     cambios en los consumers (cascada queda para Fase 6).
  Widget _buildProxyPredictionsOverlay(
    BuildContext context,
    List<PlacePredictionDM> predictions,
  ) {
    return _ProxyPredictionListView(
      predictions: predictions,
      onPredictionSelect: (prediction) async {
        _hideOverlay();
        _focusNode.unfocus();

        _prevSearchTerm = prediction.description;
        _textController.value = TextEditingValue(
          text: prediction.description,
          selection: TextSelection.collapsed(offset: prediction.description.length),
        );

        if (widget.detailRequired && widget.onPickedPlaceDetail != null) {
          final result = await _proxyRepo!.details(
            placeId: prediction.placeId,
            sessionToken: _sessionToken,
            language: widget.language,
            region: widget.region,
          );

          if (!mounted) return;

          result.when(
            success: (response) {
              final place = response.result;
              if (place == null || !response.status.isOk) {
                // NOT_FOUND / status no-ok → no disparamos el callback.
                // El caller ya maneja "no hubo detalle" como no-op.
                widget.onSearchFailed?.call('Place details status: ${response.status.name}');
                return;
              }
              widget.onPickedPlaceDetail?.call(novaPlaceFromDM(place));
            },
            failure: (failure) {
              widget.onSearchFailed?.call(failure.error.toString());
            },
          );
        }
      },
    );
  }

  void _showOverlay(BuildContext context, Widget child) {
    final currentContext = _textFieldKey.currentContext;
    if (currentContext == null) return;

    final textFieldRenderBox = currentContext.findRenderObject() as RenderBox;
    final offset = textFieldRenderBox.localToGlobal(Offset.zero);
    final textFieldSize = textFieldRenderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (ctz) {
        return Positioned(
          top: offset.dy + textFieldSize.height,
          left: offset.dx,
          width: textFieldSize.width,
          child: CompositedTransformFollower(
            link: _link,
            showWhenUnlinked: false,
            offset: Offset(0.0, textFieldSize.height + widget.spaceBetweenTextFieldAndSuggestions),
            child: Material(
              elevation: 4.0,
              color: widget.suggestionsBackgroundColor,
              child: child,
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class PredictionListView extends StatelessWidget {
  const PredictionListView({
    super.key,
    required this.predictions,
    required this.onPredictionSelect,
  });

  final List<PlaceAutocompletePrediction> predictions;
  final ValueChanged<PlaceAutocompletePrediction> onPredictionSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      itemCount: predictions.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final prediction = predictions[index];
        return ListTile(
          title: Text(
            prediction.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onPredictionSelect(prediction),
        );
      },
    );
  }
}

/// Gemelo de [PredictionListView] que renderiza `PlacePredictionDM` en vez
/// de `PlaceAutocompletePrediction` de nova. Privado: solo lo usa el
/// widget en la ruta proxy. Se elimina en Fase 6 junto con la `PredictionListView`
/// original cuando toda la cascada pase a DMs.
///
/// Idéntico en UX a su gemelo para que el flip del flag no cambie el look:
/// misma padding, mismo separator, mismo `maxLines: 2` + ellipsis. Si algún
/// día queremos enriquecer la UI con `structured_formatting` (main/secondary),
/// el DM ya lo trae — pero lo dejamos para un PR cosmético aparte.
class _ProxyPredictionListView extends StatelessWidget {
  const _ProxyPredictionListView({
    required this.predictions,
    required this.onPredictionSelect,
  });

  final List<PlacePredictionDM> predictions;
  final ValueChanged<PlacePredictionDM> onPredictionSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      itemCount: predictions.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final prediction = predictions[index];
        return ListTile(
          title: Text(
            prediction.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onPredictionSelect(prediction),
        );
      },
    );
  }
}

class FoodlyPlacesAutocompleteWdgController {
  FoodlyPlacesAutocompleteWdgState? _autocompleteSearch;

  void attach(FoodlyPlacesAutocompleteWdgState searchWidget) {
    _autocompleteSearch = searchWidget;
  }

  void detach() => _autocompleteSearch = null;

  void clear() => _autocompleteSearch?._clearText();

  void reset() => _autocompleteSearch?._resetSearchBar();

  void clearOverlay() => _autocompleteSearch?._hideOverlay();
}

String generateSessionToken() => DateTime.now().millisecondsSinceEpoch.toString();

class PlaceDebouncer {
  PlaceDebouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
