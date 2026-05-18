// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_import_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuImportVM {
  /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
  /// se vacía y los paths persistidos viven en `uploadedImages`.
  List<File> get selectedFiles => throw _privateConstructorUsedError;

  /// Session ID recibido del primer /upload. El FE lo guarda para que,
  /// si el manager agrega más fotos en una segunda tanda (mismo flow,
  /// sin cerrar la pantalla), las nuevas se persistan bajo el mismo
  /// storage path en GCS — necesario para reanudación si la app muere.
  String? get sessionId => throw _privateConstructorUsedError;

  /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
  /// como source-of-truth de qué se subió por si el flow continúa
  /// luego (decisión 1 = B del PRD del 2026-05-09).
  List<MenuImportUploadedImageDM> get uploadedImages =>
      throw _privateConstructorUsedError;

  /// Acumulado de las respuestas /parse — una por foto. Cada call al
  /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
  /// los unifica/dedup en un único árbol que el manager edita.
  List<ParsedCategoryGroupDM> get parsedGroups =>
      throw _privateConstructorUsedError;

  /// Progreso visible al manager durante upload/parse. `total` se setea
  /// al inicio del paso correspondiente.
  int get currentStepIndex => throw _privateConstructorUsedError;
  int get currentStepTotal => throw _privateConstructorUsedError;

  /// Stats del bulk-import al confirmar. Usado en el dialog Foodly de
  /// éxito ("Importamos {totalItems} items en {totalCategories} categorías").
  MenuImportBulkStatsDM? get bulkStats => throw _privateConstructorUsedError;

  /// Locale del usuario para hint al NLP. ES por default; el cubit lo
  /// pisa con el locale activo de la app cuando se inyecta.
  String get locale => throw _privateConstructorUsedError;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuImportVMCopyWith<MenuImportVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuImportVMCopyWith<$Res> {
  factory $MenuImportVMCopyWith(
          MenuImportVM value, $Res Function(MenuImportVM) then) =
      _$MenuImportVMCopyWithImpl<$Res, MenuImportVM>;
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
class _$MenuImportVMCopyWithImpl<$Res, $Val extends MenuImportVM>
    implements $MenuImportVMCopyWith<$Res> {
  _$MenuImportVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      selectedFiles: null == selectedFiles
          ? _value.selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<File>,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: null == uploadedImages
          ? _value.uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<MenuImportUploadedImageDM>,
      parsedGroups: null == parsedGroups
          ? _value.parsedGroups
          : parsedGroups // ignore: cast_nullable_to_non_nullable
              as List<ParsedCategoryGroupDM>,
      currentStepIndex: null == currentStepIndex
          ? _value.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentStepTotal: null == currentStepTotal
          ? _value.currentStepTotal
          : currentStepTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bulkStats: freezed == bulkStats
          ? _value.bulkStats
          : bulkStats // ignore: cast_nullable_to_non_nullable
              as MenuImportBulkStatsDM?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImportVMImplCopyWith<$Res>
    implements $MenuImportVMCopyWith<$Res> {
  factory _$$MenuImportVMImplCopyWith(
          _$MenuImportVMImpl value, $Res Function(_$MenuImportVMImpl) then) =
      __$$MenuImportVMImplCopyWithImpl<$Res>;
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
class __$$MenuImportVMImplCopyWithImpl<$Res>
    extends _$MenuImportVMCopyWithImpl<$Res, _$MenuImportVMImpl>
    implements _$$MenuImportVMImplCopyWith<$Res> {
  __$$MenuImportVMImplCopyWithImpl(
      _$MenuImportVMImpl _value, $Res Function(_$MenuImportVMImpl) _then)
      : super(_value, _then);

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
    return _then(_$MenuImportVMImpl(
      selectedFiles: null == selectedFiles
          ? _value._selectedFiles
          : selectedFiles // ignore: cast_nullable_to_non_nullable
              as List<File>,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: null == uploadedImages
          ? _value._uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<MenuImportUploadedImageDM>,
      parsedGroups: null == parsedGroups
          ? _value._parsedGroups
          : parsedGroups // ignore: cast_nullable_to_non_nullable
              as List<ParsedCategoryGroupDM>,
      currentStepIndex: null == currentStepIndex
          ? _value.currentStepIndex
          : currentStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentStepTotal: null == currentStepTotal
          ? _value.currentStepTotal
          : currentStepTotal // ignore: cast_nullable_to_non_nullable
              as int,
      bulkStats: freezed == bulkStats
          ? _value.bulkStats
          : bulkStats // ignore: cast_nullable_to_non_nullable
              as MenuImportBulkStatsDM?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MenuImportVMImpl extends _MenuImportVM {
  const _$MenuImportVMImpl(
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

  @override
  String toString() {
    return 'MenuImportVM(selectedFiles: $selectedFiles, sessionId: $sessionId, uploadedImages: $uploadedImages, parsedGroups: $parsedGroups, currentStepIndex: $currentStepIndex, currentStepTotal: $currentStepTotal, bulkStats: $bulkStats, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImportVMImpl &&
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

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImportVMImplCopyWith<_$MenuImportVMImpl> get copyWith =>
      __$$MenuImportVMImplCopyWithImpl<_$MenuImportVMImpl>(this, _$identity);
}

abstract class _MenuImportVM extends MenuImportVM {
  const factory _MenuImportVM(
      {final List<File> selectedFiles,
      final String? sessionId,
      final List<MenuImportUploadedImageDM> uploadedImages,
      final List<ParsedCategoryGroupDM> parsedGroups,
      final int currentStepIndex,
      final int currentStepTotal,
      final MenuImportBulkStatsDM? bulkStats,
      final String locale}) = _$MenuImportVMImpl;
  const _MenuImportVM._() : super._();

  /// Fotos elegidas por el manager ANTES del upload. Una vez subidas,
  /// se vacía y los paths persistidos viven en `uploadedImages`.
  @override
  List<File> get selectedFiles;

  /// Session ID recibido del primer /upload. El FE lo guarda para que,
  /// si el manager agrega más fotos en una segunda tanda (mismo flow,
  /// sin cerrar la pantalla), las nuevas se persistan bajo el mismo
  /// storage path en GCS — necesario para reanudación si la app muere.
  @override
  String? get sessionId;

  /// Paths + URLs de fotos efectivamente subidas a GCS. Persistido
  /// como source-of-truth de qué se subió por si el flow continúa
  /// luego (decisión 1 = B del PRD del 2026-05-09).
  @override
  List<MenuImportUploadedImageDM> get uploadedImages;

  /// Acumulado de las respuestas /parse — una por foto. Cada call al
  /// NLP devuelve un `grouped_menu` independiente; la vista de revisión
  /// los unifica/dedup en un único árbol que el manager edita.
  @override
  List<ParsedCategoryGroupDM> get parsedGroups;

  /// Progreso visible al manager durante upload/parse. `total` se setea
  /// al inicio del paso correspondiente.
  @override
  int get currentStepIndex;
  @override
  int get currentStepTotal;

  /// Stats del bulk-import al confirmar. Usado en el dialog Foodly de
  /// éxito ("Importamos {totalItems} items en {totalCategories} categorías").
  @override
  MenuImportBulkStatsDM? get bulkStats;

  /// Locale del usuario para hint al NLP. ES por default; el cubit lo
  /// pisa con el locale activo de la app cuando se inyecta.
  @override
  String get locale;

  /// Create a copy of MenuImportVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuImportVMImplCopyWith<_$MenuImportVMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
