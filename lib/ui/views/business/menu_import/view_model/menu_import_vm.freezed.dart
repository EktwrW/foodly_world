// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_import_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuImportVM {
  /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
  /// se vacía y los paths persistidos viven en `uploadedImages`.
  List<File> get selectedFiles;

  /// Session ID recibido del primer /upload. El FE lo guarda para que,
  /// si el manager agrega más fotos en una segunda tanda (mismo flow,
  /// sin cerrar la pantalla), las nuevas se persistan bajo el mismo
  /// storage path en GCS — necesario para reanudación si la app muere.
  String? get sessionId;

  /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
  /// como source-of-truth de qué se subió por si el flow continúa
  /// luego (decisión 1 = B del PRD del 2026-05-09).
  List<MenuImportUploadedImageDM> get uploadedImages;

  /// Acumulado de las respuestas /parse — una por foto. Cada call al
  /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
  /// los unifica/dedup en un único árbol que el manager edita.
  List<ParsedCategoryGroupDM> get parsedGroups;

  /// Progreso visible al manager durante upload/parse. `total` se setea
  /// al inicio del paso correspondiente.
  int get currentStepIndex;
  int get currentStepTotal;

  /// Stats del bulk-import al confirmar. Usado en el dialog Foodly de
  /// éxito ("Importamos {totalItems} items en {totalCategories} categorías").
  MenuImportBulkStatsDM? get bulkStats;

  /// Locale del usuario para hint al NLP. ES por default; el cubit lo
  /// pisa con el locale activo de la app cuando se inyecta.
  String get locale;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuImportVMCopyWith<MenuImportVM> get copyWith =>
      _$MenuImportVMCopyWithImpl<MenuImportVM>(
          this as MenuImportVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuImportVM &&
            const DeepCollectionEquality()
                .equals(other.selectedFiles, selectedFiles) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality()
                .equals(other.uploadedImages, uploadedImages) &&
            const DeepCollectionEquality()
                .equals(other.parsedGroups, parsedGroups) &&
            (identical(other.currentStepIndex, currentStepIndex) ||
                other.currentStepIndex == currentStepIndex) &&
            (identical(other.currentStepTotal, currentStepTotal) ||
                other.currentStepTotal == currentStepTotal) &&
            (identical(other.bulkStats, bulkStats) ||
                other.bulkStats == bulkStats) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedFiles),
      sessionId,
      const DeepCollectionEquality().hash(uploadedImages),
      const DeepCollectionEquality().hash(parsedGroups),
      currentStepIndex,
      currentStepTotal,
      bulkStats,
      locale);

  @override
  String toString() {
    return 'MenuImportVM(selectedFiles: $selectedFiles, sessionId: $sessionId, uploadedImages: $uploadedImages, parsedGroups: $parsedGroups, currentStepIndex: $currentStepIndex, currentStepTotal: $currentStepTotal, bulkStats: $bulkStats, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class $MenuImportVMCopyWith<$Res> {
  factory $MenuImportVMCopyWith(
          MenuImportVM value, $Res Function(MenuImportVM) _then) =
      _$MenuImportVMCopyWithImpl;
  @useResult
  $Res call(
      {List<File> selectedFiles,
      String? sessionId,
      List<MenuImportUploadedImageDM> uploadedImages,
      List<ParsedCategoryGroupDM> parsedGroups,
      int currentStepIndex,
      int currentStepTotal,
      MenuImportBulkStatsDM? bulkStats,
      String locale});
}

/// @nodoc
class _$MenuImportVMCopyWithImpl<$Res> implements $MenuImportVMCopyWith<$Res> {
  _$MenuImportVMCopyWithImpl(this._self, this._then);

  final MenuImportVM _self;
  final $Res Function(MenuImportVM) _then;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFiles = null,
    Object? sessionId = freezed,
    Object? uploadedImages = null,
    Object? parsedGroups = null,
    Object? currentStepIndex = null,
    Object? currentStepTotal = null,
    Object? bulkStats = freezed,
    Object? locale = null,
  }) {
    return _then(_self.copyWith(
      selectedFiles: null == selectedFiles
          ? _self.selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<File>,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: null == uploadedImages
          ? _self.uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<MenuImportUploadedImageDM>,
      parsedGroups: null == parsedGroups
          ? _self.parsedGroups
          : parsedGroups // ignore: cast_nullable_to_non_nullable
              as List<ParsedCategoryGroupDM>,
      currentStepIndex: null == currentStepIndex
          ? _self.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentStepTotal: null == currentStepTotal
          ? _self.currentStepTotal
          : currentStepTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bulkStats: freezed == bulkStats
          ? _self.bulkStats
          : bulkStats // ignore: cast_nullable_to_non_nullable
              as MenuImportBulkStatsDM?,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MenuImportVM].
extension MenuImportVMPatterns on MenuImportVM {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MenuImportVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MenuImportVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MenuImportVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<File> selectedFiles,
            String? sessionId,
            List<MenuImportUploadedImageDM> uploadedImages,
            List<ParsedCategoryGroupDM> parsedGroups,
            int currentStepIndex,
            int currentStepTotal,
            MenuImportBulkStatsDM? bulkStats,
            String locale)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM() when $default != null:
        return $default(
            _that.selectedFiles,
            _that.sessionId,
            _that.uploadedImages,
            _that.parsedGroups,
            _that.currentStepIndex,
            _that.currentStepTotal,
            _that.bulkStats,
            _that.locale);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<File> selectedFiles,
            String? sessionId,
            List<MenuImportUploadedImageDM> uploadedImages,
            List<ParsedCategoryGroupDM> parsedGroups,
            int currentStepIndex,
            int currentStepTotal,
            MenuImportBulkStatsDM? bulkStats,
            String locale)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM():
        return $default(
            _that.selectedFiles,
            _that.sessionId,
            _that.uploadedImages,
            _that.parsedGroups,
            _that.currentStepIndex,
            _that.currentStepTotal,
            _that.bulkStats,
            _that.locale);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<File> selectedFiles,
            String? sessionId,
            List<MenuImportUploadedImageDM> uploadedImages,
            List<ParsedCategoryGroupDM> parsedGroups,
            int currentStepIndex,
            int currentStepTotal,
            MenuImportBulkStatsDM? bulkStats,
            String locale)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MenuImportVM() when $default != null:
        return $default(
            _that.selectedFiles,
            _that.sessionId,
            _that.uploadedImages,
            _that.parsedGroups,
            _that.currentStepIndex,
            _that.currentStepTotal,
            _that.bulkStats,
            _that.locale);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MenuImportVM extends MenuImportVM {
  const _MenuImportVM(
      {final List<File> selectedFiles = const <File>[],
      this.sessionId,
      final List<MenuImportUploadedImageDM> uploadedImages =
          const <MenuImportUploadedImageDM>[],
      final List<ParsedCategoryGroupDM> parsedGroups =
          const <ParsedCategoryGroupDM>[],
      this.currentStepIndex = 0,
      this.currentStepTotal = 0,
      this.bulkStats,
      this.locale = 'es'})
      : _selectedFiles = selectedFiles,
        _uploadedImages = uploadedImages,
        _parsedGroups = parsedGroups,
        super._();

  /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
  /// se vacía y los paths persistidos viven en `uploadedImages`.
  final List<File> _selectedFiles;

  /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
  /// se vacía y los paths persistidos viven en `uploadedImages`.
  @override
  @JsonKey()
  List<File> get selectedFiles {
    if (_selectedFiles is EqualUnmodifiableListView) return _selectedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFiles);
  }

  /// Session ID recibido del primer /upload. El FE lo guarda para que,
  /// si el manager agrega más fotos en una segunda tanda (mismo flow,
  /// sin cerrar la pantalla), las nuevas se persistan bajo el mismo
  /// storage path en GCS — necesario para reanudación si la app muere.
  @override
  final String? sessionId;

  /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
  /// como source-of-truth de qué se subió por si el flow continúa
  /// luego (decisión 1 = B del PRD del 2026-05-09).
  final List<MenuImportUploadedImageDM> _uploadedImages;

  /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
  /// como source-of-truth de qué se subió por si el flow continúa
  /// luego (decisión 1 = B del PRD del 2026-05-09).
  @override
  @JsonKey()
  List<MenuImportUploadedImageDM> get uploadedImages {
    if (_uploadedImages is EqualUnmodifiableListView) return _uploadedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadedImages);
  }

  /// Acumulado de las respuestas /parse — una por foto. Cada call al
  /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
  /// los unifica/dedup en un único árbol que el manager edita.
  final List<ParsedCategoryGroupDM> _parsedGroups;

  /// Acumulado de las respuestas /parse — una por foto. Cada call al
  /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
  /// los unifica/dedup en un único árbol que el manager edita.
  @override
  @JsonKey()
  List<ParsedCategoryGroupDM> get parsedGroups {
    if (_parsedGroups is EqualUnmodifiableListView) return _parsedGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parsedGroups);
  }

  /// Progreso visible al manager durante upload/parse. `total` se setea
  /// al inicio del paso correspondiente.
  @override
  @JsonKey()
  final int currentStepIndex;
  @override
  @JsonKey()
  final int currentStepTotal;

  /// Stats del bulk-import al confirmar. Usado en el dialog Foodly de
  /// éxito ("Importamos {totalItems} items en {totalCategories} categorías").
  @override
  final MenuImportBulkStatsDM? bulkStats;

  /// Locale del usuario para hint al NLP. ES por default; el cubit lo
  /// pisa con el locale activo de la app cuando se inyecta.
  @override
  @JsonKey()
  final String locale;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuImportVMCopyWith<_MenuImportVM> get copyWith =>
      __$MenuImportVMCopyWithImpl<_MenuImportVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuImportVM &&
            const DeepCollectionEquality()
                .equals(other._selectedFiles, _selectedFiles) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality()
                .equals(other._uploadedImages, _uploadedImages) &&
            const DeepCollectionEquality()
                .equals(other._parsedGroups, _parsedGroups) &&
            (identical(other.currentStepIndex, currentStepIndex) ||
                other.currentStepIndex == currentStepIndex) &&
            (identical(other.currentStepTotal, currentStepTotal) ||
                other.currentStepTotal == currentStepTotal) &&
            (identical(other.bulkStats, bulkStats) ||
                other.bulkStats == bulkStats) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedFiles),
      sessionId,
      const DeepCollectionEquality().hash(_uploadedImages),
      const DeepCollectionEquality().hash(_parsedGroups),
      currentStepIndex,
      currentStepTotal,
      bulkStats,
      locale);

  @override
  String toString() {
    return 'MenuImportVM(selectedFiles: $selectedFiles, sessionId: $sessionId, uploadedImages: $uploadedImages, parsedGroups: $parsedGroups, currentStepIndex: $currentStepIndex, currentStepTotal: $currentStepTotal, bulkStats: $bulkStats, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$MenuImportVMCopyWith<$Res>
    implements $MenuImportVMCopyWith<$Res> {
  factory _$MenuImportVMCopyWith(
          _MenuImportVM value, $Res Function(_MenuImportVM) _then) =
      __$MenuImportVMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<File> selectedFiles,
      String? sessionId,
      List<MenuImportUploadedImageDM> uploadedImages,
      List<ParsedCategoryGroupDM> parsedGroups,
      int currentStepIndex,
      int currentStepTotal,
      MenuImportBulkStatsDM? bulkStats,
      String locale});
}

/// @nodoc
class __$MenuImportVMCopyWithImpl<$Res>
    implements _$MenuImportVMCopyWith<$Res> {
  __$MenuImportVMCopyWithImpl(this._self, this._then);

  final _MenuImportVM _self;
  final $Res Function(_MenuImportVM) _then;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedFiles = null,
    Object? sessionId = freezed,
    Object? uploadedImages = null,
    Object? parsedGroups = null,
    Object? currentStepIndex = null,
    Object? currentStepTotal = null,
    Object? bulkStats = freezed,
    Object? locale = null,
  }) {
    return _then(_MenuImportVM(
      selectedFiles: null == selectedFiles
          ? _self._selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<File>,
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: null == uploadedImages
          ? _self._uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<MenuImportUploadedImageDM>,
      parsedGroups: null == parsedGroups
          ? _self._parsedGroups
          : parsedGroups // ignore: cast_nullable_to_non_nullable
              as List<ParsedCategoryGroupDM>,
      currentStepIndex: null == currentStepIndex
          ? _self.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentStepTotal: null == currentStepTotal
          ? _self.currentStepTotal
          : currentStepTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bulkStats: freezed == bulkStats
          ? _self.bulkStats
          : bulkStats // ignore: cast_nullable_to_non_nullable
              as MenuImportBulkStatsDM?,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
