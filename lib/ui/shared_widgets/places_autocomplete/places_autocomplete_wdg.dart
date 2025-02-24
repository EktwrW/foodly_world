import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show BaseConfig, di;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
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
        color: disabled ? ui.NeumoColors.disabled : FoodlyThemes.primaryFoodly,
      ).paddingBottom(6),
      cancelIcon: Icon(
        Bootstrap.eraser_fill,
        size: 22,
        color: disabled ? ui.NeumoColors.disabled : FoodlyThemes.primaryFoodly,
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
  late final PlacesApi _placesApi;
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
    _placesApi = PlacesApi(apiKey: widget.apiKey);
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
    _placesApi.dispose();
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
                    color: ui.NeumoColors.disabled,
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

  Future<void> _handleSearchText(String searchTerm) async {
    if (searchTerm.isEmpty || !_focusNode.hasFocus) {
      _hideOverlay();
      return;
    }

    _prevSearchTerm = searchTerm;

    try {
      final response = await _placesApi.placeAutocomplete(
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

          final resp = await _placesApi.getPlaceDetails(
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
