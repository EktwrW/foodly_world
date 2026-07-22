// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'BusinessEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BusinessEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent()';
  }
}

/// @nodoc
class $BusinessEventCopyWith<$Res> {
  $BusinessEventCopyWith(BusinessEvent _, $Res Function(BusinessEvent) __);
}

/// Adds pattern-matching-related methods to [BusinessEvent].
extension BusinessEventPatterns on BusinessEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateLogo value)? updateLogo,
    TResult Function(_EditCoverImagesDialog value)? editCoverImagesDialog,
    TResult Function(_AddPicture value)? addPicture,
    TResult Function(_SetCategory value)? setCategory,
    TResult Function(_SetService value)? setService,
    TResult Function(_SetOpeningHoursDay value)? setOpeningHoursDay,
    TResult Function(_UploadPictures value)? uploadPictures,
    TResult Function(_UpdatePicture value)? updatePicture,
    TResult Function(_CancelUploadPictures value)? cancelUploadPictures,
    TResult Function(_DeleteCoverImageById value)? deleteCoverImageById,
    TResult Function(_CancelDeleteCoverImage value)? cancelDeleteCoverImage,
    TResult Function(_UpdateEditing value)? updateEditing,
    TResult Function(_EditLocationDialog value)? editLocationDialog,
    TResult Function(_SetCountry value)? setCountry,
    TResult Function(_SetAddressFromPlacesAPI value)? setAddressFromPlacesAPI,
    TResult Function(_SetMapController value)? setMapController,
    TResult Function(_UpdateBusiness value)? updateBusiness,
    TResult Function(_ToggleAllowReservations value)? toggleAllowReservations,
    TResult Function(_SetReservationSizeLimit value)? setReservationSizeLimit,
    TResult Function(_ToggleMenuEnabled value)? toggleMenuEnabled,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _UpdateLogo() when updateLogo != null:
        return updateLogo(_that);
      case _EditCoverImagesDialog() when editCoverImagesDialog != null:
        return editCoverImagesDialog(_that);
      case _AddPicture() when addPicture != null:
        return addPicture(_that);
      case _SetCategory() when setCategory != null:
        return setCategory(_that);
      case _SetService() when setService != null:
        return setService(_that);
      case _SetOpeningHoursDay() when setOpeningHoursDay != null:
        return setOpeningHoursDay(_that);
      case _UploadPictures() when uploadPictures != null:
        return uploadPictures(_that);
      case _UpdatePicture() when updatePicture != null:
        return updatePicture(_that);
      case _CancelUploadPictures() when cancelUploadPictures != null:
        return cancelUploadPictures(_that);
      case _DeleteCoverImageById() when deleteCoverImageById != null:
        return deleteCoverImageById(_that);
      case _CancelDeleteCoverImage() when cancelDeleteCoverImage != null:
        return cancelDeleteCoverImage(_that);
      case _UpdateEditing() when updateEditing != null:
        return updateEditing(_that);
      case _EditLocationDialog() when editLocationDialog != null:
        return editLocationDialog(_that);
      case _SetCountry() when setCountry != null:
        return setCountry(_that);
      case _SetAddressFromPlacesAPI() when setAddressFromPlacesAPI != null:
        return setAddressFromPlacesAPI(_that);
      case _SetMapController() when setMapController != null:
        return setMapController(_that);
      case _UpdateBusiness() when updateBusiness != null:
        return updateBusiness(_that);
      case _ToggleAllowReservations() when toggleAllowReservations != null:
        return toggleAllowReservations(_that);
      case _SetReservationSizeLimit() when setReservationSizeLimit != null:
        return setReservationSizeLimit(_that);
      case _ToggleMenuEnabled() when toggleMenuEnabled != null:
        return toggleMenuEnabled(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateLogo value) updateLogo,
    required TResult Function(_EditCoverImagesDialog value)
        editCoverImagesDialog,
    required TResult Function(_AddPicture value) addPicture,
    required TResult Function(_SetCategory value) setCategory,
    required TResult Function(_SetService value) setService,
    required TResult Function(_SetOpeningHoursDay value) setOpeningHoursDay,
    required TResult Function(_UploadPictures value) uploadPictures,
    required TResult Function(_UpdatePicture value) updatePicture,
    required TResult Function(_CancelUploadPictures value) cancelUploadPictures,
    required TResult Function(_DeleteCoverImageById value) deleteCoverImageById,
    required TResult Function(_CancelDeleteCoverImage value)
        cancelDeleteCoverImage,
    required TResult Function(_UpdateEditing value) updateEditing,
    required TResult Function(_EditLocationDialog value) editLocationDialog,
    required TResult Function(_SetCountry value) setCountry,
    required TResult Function(_SetAddressFromPlacesAPI value)
        setAddressFromPlacesAPI,
    required TResult Function(_SetMapController value) setMapController,
    required TResult Function(_UpdateBusiness value) updateBusiness,
    required TResult Function(_ToggleAllowReservations value)
        toggleAllowReservations,
    required TResult Function(_SetReservationSizeLimit value)
        setReservationSizeLimit,
    required TResult Function(_ToggleMenuEnabled value) toggleMenuEnabled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _UpdateLogo():
        return updateLogo(_that);
      case _EditCoverImagesDialog():
        return editCoverImagesDialog(_that);
      case _AddPicture():
        return addPicture(_that);
      case _SetCategory():
        return setCategory(_that);
      case _SetService():
        return setService(_that);
      case _SetOpeningHoursDay():
        return setOpeningHoursDay(_that);
      case _UploadPictures():
        return uploadPictures(_that);
      case _UpdatePicture():
        return updatePicture(_that);
      case _CancelUploadPictures():
        return cancelUploadPictures(_that);
      case _DeleteCoverImageById():
        return deleteCoverImageById(_that);
      case _CancelDeleteCoverImage():
        return cancelDeleteCoverImage(_that);
      case _UpdateEditing():
        return updateEditing(_that);
      case _EditLocationDialog():
        return editLocationDialog(_that);
      case _SetCountry():
        return setCountry(_that);
      case _SetAddressFromPlacesAPI():
        return setAddressFromPlacesAPI(_that);
      case _SetMapController():
        return setMapController(_that);
      case _UpdateBusiness():
        return updateBusiness(_that);
      case _ToggleAllowReservations():
        return toggleAllowReservations(_that);
      case _SetReservationSizeLimit():
        return setReservationSizeLimit(_that);
      case _ToggleMenuEnabled():
        return toggleMenuEnabled(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateLogo value)? updateLogo,
    TResult? Function(_EditCoverImagesDialog value)? editCoverImagesDialog,
    TResult? Function(_AddPicture value)? addPicture,
    TResult? Function(_SetCategory value)? setCategory,
    TResult? Function(_SetService value)? setService,
    TResult? Function(_SetOpeningHoursDay value)? setOpeningHoursDay,
    TResult? Function(_UploadPictures value)? uploadPictures,
    TResult? Function(_UpdatePicture value)? updatePicture,
    TResult? Function(_CancelUploadPictures value)? cancelUploadPictures,
    TResult? Function(_DeleteCoverImageById value)? deleteCoverImageById,
    TResult? Function(_CancelDeleteCoverImage value)? cancelDeleteCoverImage,
    TResult? Function(_UpdateEditing value)? updateEditing,
    TResult? Function(_EditLocationDialog value)? editLocationDialog,
    TResult? Function(_SetCountry value)? setCountry,
    TResult? Function(_SetAddressFromPlacesAPI value)? setAddressFromPlacesAPI,
    TResult? Function(_SetMapController value)? setMapController,
    TResult? Function(_UpdateBusiness value)? updateBusiness,
    TResult? Function(_ToggleAllowReservations value)? toggleAllowReservations,
    TResult? Function(_SetReservationSizeLimit value)? setReservationSizeLimit,
    TResult? Function(_ToggleMenuEnabled value)? toggleMenuEnabled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _UpdateLogo() when updateLogo != null:
        return updateLogo(_that);
      case _EditCoverImagesDialog() when editCoverImagesDialog != null:
        return editCoverImagesDialog(_that);
      case _AddPicture() when addPicture != null:
        return addPicture(_that);
      case _SetCategory() when setCategory != null:
        return setCategory(_that);
      case _SetService() when setService != null:
        return setService(_that);
      case _SetOpeningHoursDay() when setOpeningHoursDay != null:
        return setOpeningHoursDay(_that);
      case _UploadPictures() when uploadPictures != null:
        return uploadPictures(_that);
      case _UpdatePicture() when updatePicture != null:
        return updatePicture(_that);
      case _CancelUploadPictures() when cancelUploadPictures != null:
        return cancelUploadPictures(_that);
      case _DeleteCoverImageById() when deleteCoverImageById != null:
        return deleteCoverImageById(_that);
      case _CancelDeleteCoverImage() when cancelDeleteCoverImage != null:
        return cancelDeleteCoverImage(_that);
      case _UpdateEditing() when updateEditing != null:
        return updateEditing(_that);
      case _EditLocationDialog() when editLocationDialog != null:
        return editLocationDialog(_that);
      case _SetCountry() when setCountry != null:
        return setCountry(_that);
      case _SetAddressFromPlacesAPI() when setAddressFromPlacesAPI != null:
        return setAddressFromPlacesAPI(_that);
      case _SetMapController() when setMapController != null:
        return setMapController(_that);
      case _UpdateBusiness() when updateBusiness != null:
        return updateBusiness(_that);
      case _ToggleAllowReservations() when toggleAllowReservations != null:
        return toggleAllowReservations(_that);
      case _SetReservationSizeLimit() when setReservationSizeLimit != null:
        return setReservationSizeLimit(_that);
      case _ToggleMenuEnabled() when toggleMenuEnabled != null:
        return toggleMenuEnabled(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String path)? updateLogo,
    TResult Function()? editCoverImagesDialog,
    TResult Function(String path)? addPicture,
    TResult Function(FoodlyCategories category)? setCategory,
    TResult Function(BusinessServices service)? setService,
    TResult Function(int dayIndex, Day day)? setOpeningHoursDay,
    TResult Function()? uploadPictures,
    TResult Function(String imageId, String filePath)? updatePicture,
    TResult Function()? cancelUploadPictures,
    TResult Function(BusinessCoverImageDM coverImageDM)? deleteCoverImageById,
    TResult Function()? cancelDeleteCoverImage,
    TResult Function(DashboardEditing editing)? updateEditing,
    TResult Function()? editLocationDialog,
    TResult Function(FoodlyCountries country)? setCountry,
    TResult Function(Place detail)? setAddressFromPlacesAPI,
    TResult Function(GoogleMapController controller)? setMapController,
    TResult Function()? updateBusiness,
    TResult Function(bool value)? toggleAllowReservations,
    TResult Function(int value)? setReservationSizeLimit,
    TResult Function(bool value)? toggleMenuEnabled,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _UpdateLogo() when updateLogo != null:
        return updateLogo(_that.path);
      case _EditCoverImagesDialog() when editCoverImagesDialog != null:
        return editCoverImagesDialog();
      case _AddPicture() when addPicture != null:
        return addPicture(_that.path);
      case _SetCategory() when setCategory != null:
        return setCategory(_that.category);
      case _SetService() when setService != null:
        return setService(_that.service);
      case _SetOpeningHoursDay() when setOpeningHoursDay != null:
        return setOpeningHoursDay(_that.dayIndex, _that.day);
      case _UploadPictures() when uploadPictures != null:
        return uploadPictures();
      case _UpdatePicture() when updatePicture != null:
        return updatePicture(_that.imageId, _that.filePath);
      case _CancelUploadPictures() when cancelUploadPictures != null:
        return cancelUploadPictures();
      case _DeleteCoverImageById() when deleteCoverImageById != null:
        return deleteCoverImageById(_that.coverImageDM);
      case _CancelDeleteCoverImage() when cancelDeleteCoverImage != null:
        return cancelDeleteCoverImage();
      case _UpdateEditing() when updateEditing != null:
        return updateEditing(_that.editing);
      case _EditLocationDialog() when editLocationDialog != null:
        return editLocationDialog();
      case _SetCountry() when setCountry != null:
        return setCountry(_that.country);
      case _SetAddressFromPlacesAPI() when setAddressFromPlacesAPI != null:
        return setAddressFromPlacesAPI(_that.detail);
      case _SetMapController() when setMapController != null:
        return setMapController(_that.controller);
      case _UpdateBusiness() when updateBusiness != null:
        return updateBusiness();
      case _ToggleAllowReservations() when toggleAllowReservations != null:
        return toggleAllowReservations(_that.value);
      case _SetReservationSizeLimit() when setReservationSizeLimit != null:
        return setReservationSizeLimit(_that.value);
      case _ToggleMenuEnabled() when toggleMenuEnabled != null:
        return toggleMenuEnabled(_that.value);
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
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String path) updateLogo,
    required TResult Function() editCoverImagesDialog,
    required TResult Function(String path) addPicture,
    required TResult Function(FoodlyCategories category) setCategory,
    required TResult Function(BusinessServices service) setService,
    required TResult Function(int dayIndex, Day day) setOpeningHoursDay,
    required TResult Function() uploadPictures,
    required TResult Function(String imageId, String filePath) updatePicture,
    required TResult Function() cancelUploadPictures,
    required TResult Function(BusinessCoverImageDM coverImageDM)
        deleteCoverImageById,
    required TResult Function() cancelDeleteCoverImage,
    required TResult Function(DashboardEditing editing) updateEditing,
    required TResult Function() editLocationDialog,
    required TResult Function(FoodlyCountries country) setCountry,
    required TResult Function(Place detail) setAddressFromPlacesAPI,
    required TResult Function(GoogleMapController controller) setMapController,
    required TResult Function() updateBusiness,
    required TResult Function(bool value) toggleAllowReservations,
    required TResult Function(int value) setReservationSizeLimit,
    required TResult Function(bool value) toggleMenuEnabled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _UpdateLogo():
        return updateLogo(_that.path);
      case _EditCoverImagesDialog():
        return editCoverImagesDialog();
      case _AddPicture():
        return addPicture(_that.path);
      case _SetCategory():
        return setCategory(_that.category);
      case _SetService():
        return setService(_that.service);
      case _SetOpeningHoursDay():
        return setOpeningHoursDay(_that.dayIndex, _that.day);
      case _UploadPictures():
        return uploadPictures();
      case _UpdatePicture():
        return updatePicture(_that.imageId, _that.filePath);
      case _CancelUploadPictures():
        return cancelUploadPictures();
      case _DeleteCoverImageById():
        return deleteCoverImageById(_that.coverImageDM);
      case _CancelDeleteCoverImage():
        return cancelDeleteCoverImage();
      case _UpdateEditing():
        return updateEditing(_that.editing);
      case _EditLocationDialog():
        return editLocationDialog();
      case _SetCountry():
        return setCountry(_that.country);
      case _SetAddressFromPlacesAPI():
        return setAddressFromPlacesAPI(_that.detail);
      case _SetMapController():
        return setMapController(_that.controller);
      case _UpdateBusiness():
        return updateBusiness();
      case _ToggleAllowReservations():
        return toggleAllowReservations(_that.value);
      case _SetReservationSizeLimit():
        return setReservationSizeLimit(_that.value);
      case _ToggleMenuEnabled():
        return toggleMenuEnabled(_that.value);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String path)? updateLogo,
    TResult? Function()? editCoverImagesDialog,
    TResult? Function(String path)? addPicture,
    TResult? Function(FoodlyCategories category)? setCategory,
    TResult? Function(BusinessServices service)? setService,
    TResult? Function(int dayIndex, Day day)? setOpeningHoursDay,
    TResult? Function()? uploadPictures,
    TResult? Function(String imageId, String filePath)? updatePicture,
    TResult? Function()? cancelUploadPictures,
    TResult? Function(BusinessCoverImageDM coverImageDM)? deleteCoverImageById,
    TResult? Function()? cancelDeleteCoverImage,
    TResult? Function(DashboardEditing editing)? updateEditing,
    TResult? Function()? editLocationDialog,
    TResult? Function(FoodlyCountries country)? setCountry,
    TResult? Function(Place detail)? setAddressFromPlacesAPI,
    TResult? Function(GoogleMapController controller)? setMapController,
    TResult? Function()? updateBusiness,
    TResult? Function(bool value)? toggleAllowReservations,
    TResult? Function(int value)? setReservationSizeLimit,
    TResult? Function(bool value)? toggleMenuEnabled,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _UpdateLogo() when updateLogo != null:
        return updateLogo(_that.path);
      case _EditCoverImagesDialog() when editCoverImagesDialog != null:
        return editCoverImagesDialog();
      case _AddPicture() when addPicture != null:
        return addPicture(_that.path);
      case _SetCategory() when setCategory != null:
        return setCategory(_that.category);
      case _SetService() when setService != null:
        return setService(_that.service);
      case _SetOpeningHoursDay() when setOpeningHoursDay != null:
        return setOpeningHoursDay(_that.dayIndex, _that.day);
      case _UploadPictures() when uploadPictures != null:
        return uploadPictures();
      case _UpdatePicture() when updatePicture != null:
        return updatePicture(_that.imageId, _that.filePath);
      case _CancelUploadPictures() when cancelUploadPictures != null:
        return cancelUploadPictures();
      case _DeleteCoverImageById() when deleteCoverImageById != null:
        return deleteCoverImageById(_that.coverImageDM);
      case _CancelDeleteCoverImage() when cancelDeleteCoverImage != null:
        return cancelDeleteCoverImage();
      case _UpdateEditing() when updateEditing != null:
        return updateEditing(_that.editing);
      case _EditLocationDialog() when editLocationDialog != null:
        return editLocationDialog();
      case _SetCountry() when setCountry != null:
        return setCountry(_that.country);
      case _SetAddressFromPlacesAPI() when setAddressFromPlacesAPI != null:
        return setAddressFromPlacesAPI(_that.detail);
      case _SetMapController() when setMapController != null:
        return setMapController(_that.controller);
      case _UpdateBusiness() when updateBusiness != null:
        return updateBusiness();
      case _ToggleAllowReservations() when toggleAllowReservations != null:
        return toggleAllowReservations(_that.value);
      case _SetReservationSizeLimit() when setReservationSizeLimit != null:
        return setReservationSizeLimit(_that.value);
      case _ToggleMenuEnabled() when toggleMenuEnabled != null:
        return toggleMenuEnabled(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started with DiagnosticableTreeMixin implements BusinessEvent {
  const _Started();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'BusinessEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.started()';
  }
}

/// @nodoc

class _UpdateLogo with DiagnosticableTreeMixin implements BusinessEvent {
  const _UpdateLogo(this.path);

  final String path;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateLogoCopyWith<_UpdateLogo> get copyWith =>
      __$UpdateLogoCopyWithImpl<_UpdateLogo>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.updateLogo'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateLogo &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.updateLogo(path: $path)';
  }
}

/// @nodoc
abstract mixin class _$UpdateLogoCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$UpdateLogoCopyWith(
          _UpdateLogo value, $Res Function(_UpdateLogo) _then) =
      __$UpdateLogoCopyWithImpl;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$UpdateLogoCopyWithImpl<$Res> implements _$UpdateLogoCopyWith<$Res> {
  __$UpdateLogoCopyWithImpl(this._self, this._then);

  final _UpdateLogo _self;
  final $Res Function(_UpdateLogo) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(_UpdateLogo(
      null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _EditCoverImagesDialog
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _EditCoverImagesDialog();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.editCoverImagesDialog'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EditCoverImagesDialog);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.editCoverImagesDialog()';
  }
}

/// @nodoc

class _AddPicture with DiagnosticableTreeMixin implements BusinessEvent {
  const _AddPicture(this.path);

  final String path;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddPictureCopyWith<_AddPicture> get copyWith =>
      __$AddPictureCopyWithImpl<_AddPicture>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.addPicture'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddPicture &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.addPicture(path: $path)';
  }
}

/// @nodoc
abstract mixin class _$AddPictureCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$AddPictureCopyWith(
          _AddPicture value, $Res Function(_AddPicture) _then) =
      __$AddPictureCopyWithImpl;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$AddPictureCopyWithImpl<$Res> implements _$AddPictureCopyWith<$Res> {
  __$AddPictureCopyWithImpl(this._self, this._then);

  final _AddPicture _self;
  final $Res Function(_AddPicture) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(_AddPicture(
      null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SetCategory with DiagnosticableTreeMixin implements BusinessEvent {
  const _SetCategory(this.category);

  final FoodlyCategories category;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetCategoryCopyWith<_SetCategory> get copyWith =>
      __$SetCategoryCopyWithImpl<_SetCategory>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.setCategory'))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetCategory &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setCategory(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$SetCategoryCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetCategoryCopyWith(
          _SetCategory value, $Res Function(_SetCategory) _then) =
      __$SetCategoryCopyWithImpl;
  @useResult
  $Res call({FoodlyCategories category});
}

/// @nodoc
class __$SetCategoryCopyWithImpl<$Res> implements _$SetCategoryCopyWith<$Res> {
  __$SetCategoryCopyWithImpl(this._self, this._then);

  final _SetCategory _self;
  final $Res Function(_SetCategory) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
  }) {
    return _then(_SetCategory(
      null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodlyCategories,
    ));
  }
}

/// @nodoc

class _SetService with DiagnosticableTreeMixin implements BusinessEvent {
  const _SetService(this.service);

  final BusinessServices service;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetServiceCopyWith<_SetService> get copyWith =>
      __$SetServiceCopyWithImpl<_SetService>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.setService'))
      ..add(DiagnosticsProperty('service', service));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetService &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setService(service: $service)';
  }
}

/// @nodoc
abstract mixin class _$SetServiceCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetServiceCopyWith(
          _SetService value, $Res Function(_SetService) _then) =
      __$SetServiceCopyWithImpl;
  @useResult
  $Res call({BusinessServices service});
}

/// @nodoc
class __$SetServiceCopyWithImpl<$Res> implements _$SetServiceCopyWith<$Res> {
  __$SetServiceCopyWithImpl(this._self, this._then);

  final _SetService _self;
  final $Res Function(_SetService) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
  }) {
    return _then(_SetService(
      null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as BusinessServices,
    ));
  }
}

/// @nodoc

class _SetOpeningHoursDay
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _SetOpeningHoursDay(this.dayIndex, this.day);

  final int dayIndex;
  final Day day;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetOpeningHoursDayCopyWith<_SetOpeningHoursDay> get copyWith =>
      __$SetOpeningHoursDayCopyWithImpl<_SetOpeningHoursDay>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.setOpeningHoursDay'))
      ..add(DiagnosticsProperty('dayIndex', dayIndex))
      ..add(DiagnosticsProperty('day', day));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetOpeningHoursDay &&
            (identical(other.dayIndex, dayIndex) ||
                other.dayIndex == dayIndex) &&
            (identical(other.day, day) || other.day == day));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayIndex, day);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setOpeningHoursDay(dayIndex: $dayIndex, day: $day)';
  }
}

/// @nodoc
abstract mixin class _$SetOpeningHoursDayCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetOpeningHoursDayCopyWith(
          _SetOpeningHoursDay value, $Res Function(_SetOpeningHoursDay) _then) =
      __$SetOpeningHoursDayCopyWithImpl;
  @useResult
  $Res call({int dayIndex, Day day});

  $DayCopyWith<$Res> get day;
}

/// @nodoc
class __$SetOpeningHoursDayCopyWithImpl<$Res>
    implements _$SetOpeningHoursDayCopyWith<$Res> {
  __$SetOpeningHoursDayCopyWithImpl(this._self, this._then);

  final _SetOpeningHoursDay _self;
  final $Res Function(_SetOpeningHoursDay) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dayIndex = null,
    Object? day = null,
  }) {
    return _then(_SetOpeningHoursDay(
      null == dayIndex
          ? _self.dayIndex
          : dayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day,
    ));
  }

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DayCopyWith<$Res> get day {
    return $DayCopyWith<$Res>(_self.day, (value) {
      return _then(_self.copyWith(day: value));
    });
  }
}

/// @nodoc

class _UploadPictures with DiagnosticableTreeMixin implements BusinessEvent {
  const _UploadPictures();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.uploadPictures'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UploadPictures);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.uploadPictures()';
  }
}

/// @nodoc

class _UpdatePicture with DiagnosticableTreeMixin implements BusinessEvent {
  const _UpdatePicture(this.imageId, this.filePath);

  final String imageId;
  final String filePath;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePictureCopyWith<_UpdatePicture> get copyWith =>
      __$UpdatePictureCopyWithImpl<_UpdatePicture>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.updatePicture'))
      ..add(DiagnosticsProperty('imageId', imageId))
      ..add(DiagnosticsProperty('filePath', filePath));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePicture &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageId, filePath);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.updatePicture(imageId: $imageId, filePath: $filePath)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePictureCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$UpdatePictureCopyWith(
          _UpdatePicture value, $Res Function(_UpdatePicture) _then) =
      __$UpdatePictureCopyWithImpl;
  @useResult
  $Res call({String imageId, String filePath});
}

/// @nodoc
class __$UpdatePictureCopyWithImpl<$Res>
    implements _$UpdatePictureCopyWith<$Res> {
  __$UpdatePictureCopyWithImpl(this._self, this._then);

  final _UpdatePicture _self;
  final $Res Function(_UpdatePicture) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageId = null,
    Object? filePath = null,
  }) {
    return _then(_UpdatePicture(
      null == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CancelUploadPictures
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _CancelUploadPictures();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.cancelUploadPictures'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CancelUploadPictures);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.cancelUploadPictures()';
  }
}

/// @nodoc

class _DeleteCoverImageById
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _DeleteCoverImageById(this.coverImageDM);

  final BusinessCoverImageDM coverImageDM;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCoverImageByIdCopyWith<_DeleteCoverImageById> get copyWith =>
      __$DeleteCoverImageByIdCopyWithImpl<_DeleteCoverImageById>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.deleteCoverImageById'))
      ..add(DiagnosticsProperty('coverImageDM', coverImageDM));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteCoverImageById &&
            (identical(other.coverImageDM, coverImageDM) ||
                other.coverImageDM == coverImageDM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coverImageDM);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.deleteCoverImageById(coverImageDM: $coverImageDM)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCoverImageByIdCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$DeleteCoverImageByIdCopyWith(_DeleteCoverImageById value,
          $Res Function(_DeleteCoverImageById) _then) =
      __$DeleteCoverImageByIdCopyWithImpl;
  @useResult
  $Res call({BusinessCoverImageDM coverImageDM});

  $BusinessCoverImageDMCopyWith<$Res> get coverImageDM;
}

/// @nodoc
class __$DeleteCoverImageByIdCopyWithImpl<$Res>
    implements _$DeleteCoverImageByIdCopyWith<$Res> {
  __$DeleteCoverImageByIdCopyWithImpl(this._self, this._then);

  final _DeleteCoverImageById _self;
  final $Res Function(_DeleteCoverImageById) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coverImageDM = null,
  }) {
    return _then(_DeleteCoverImageById(
      null == coverImageDM
          ? _self.coverImageDM
          : coverImageDM // ignore: cast_nullable_to_non_nullable
              as BusinessCoverImageDM,
    ));
  }

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessCoverImageDMCopyWith<$Res> get coverImageDM {
    return $BusinessCoverImageDMCopyWith<$Res>(_self.coverImageDM, (value) {
      return _then(_self.copyWith(coverImageDM: value));
    });
  }
}

/// @nodoc

class _CancelDeleteCoverImage
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _CancelDeleteCoverImage();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'BusinessEvent.cancelDeleteCoverImage'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CancelDeleteCoverImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.cancelDeleteCoverImage()';
  }
}

/// @nodoc

class _UpdateEditing with DiagnosticableTreeMixin implements BusinessEvent {
  const _UpdateEditing(this.editing);

  final DashboardEditing editing;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateEditingCopyWith<_UpdateEditing> get copyWith =>
      __$UpdateEditingCopyWithImpl<_UpdateEditing>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.updateEditing'))
      ..add(DiagnosticsProperty('editing', editing));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateEditing &&
            (identical(other.editing, editing) || other.editing == editing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editing);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.updateEditing(editing: $editing)';
  }
}

/// @nodoc
abstract mixin class _$UpdateEditingCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$UpdateEditingCopyWith(
          _UpdateEditing value, $Res Function(_UpdateEditing) _then) =
      __$UpdateEditingCopyWithImpl;
  @useResult
  $Res call({DashboardEditing editing});
}

/// @nodoc
class __$UpdateEditingCopyWithImpl<$Res>
    implements _$UpdateEditingCopyWith<$Res> {
  __$UpdateEditingCopyWithImpl(this._self, this._then);

  final _UpdateEditing _self;
  final $Res Function(_UpdateEditing) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? editing = null,
  }) {
    return _then(_UpdateEditing(
      null == editing
          ? _self.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as DashboardEditing,
    ));
  }
}

/// @nodoc

class _EditLocationDialog
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _EditLocationDialog();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.editLocationDialog'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EditLocationDialog);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.editLocationDialog()';
  }
}

/// @nodoc

class _SetCountry with DiagnosticableTreeMixin implements BusinessEvent {
  const _SetCountry(this.country);

  final FoodlyCountries country;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetCountryCopyWith<_SetCountry> get copyWith =>
      __$SetCountryCopyWithImpl<_SetCountry>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.setCountry'))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetCountry &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setCountry(country: $country)';
  }
}

/// @nodoc
abstract mixin class _$SetCountryCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetCountryCopyWith(
          _SetCountry value, $Res Function(_SetCountry) _then) =
      __$SetCountryCopyWithImpl;
  @useResult
  $Res call({FoodlyCountries country});
}

/// @nodoc
class __$SetCountryCopyWithImpl<$Res> implements _$SetCountryCopyWith<$Res> {
  __$SetCountryCopyWithImpl(this._self, this._then);

  final _SetCountry _self;
  final $Res Function(_SetCountry) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? country = null,
  }) {
    return _then(_SetCountry(
      null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as FoodlyCountries,
    ));
  }
}

/// @nodoc

class _SetAddressFromPlacesAPI
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _SetAddressFromPlacesAPI(this.detail);

  final Place detail;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetAddressFromPlacesAPICopyWith<_SetAddressFromPlacesAPI> get copyWith =>
      __$SetAddressFromPlacesAPICopyWithImpl<_SetAddressFromPlacesAPI>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'BusinessEvent.setAddressFromPlacesAPI'))
      ..add(DiagnosticsProperty('detail', detail));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetAddressFromPlacesAPI &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setAddressFromPlacesAPI(detail: $detail)';
  }
}

/// @nodoc
abstract mixin class _$SetAddressFromPlacesAPICopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetAddressFromPlacesAPICopyWith(_SetAddressFromPlacesAPI value,
          $Res Function(_SetAddressFromPlacesAPI) _then) =
      __$SetAddressFromPlacesAPICopyWithImpl;
  @useResult
  $Res call({Place detail});
}

/// @nodoc
class __$SetAddressFromPlacesAPICopyWithImpl<$Res>
    implements _$SetAddressFromPlacesAPICopyWith<$Res> {
  __$SetAddressFromPlacesAPICopyWithImpl(this._self, this._then);

  final _SetAddressFromPlacesAPI _self;
  final $Res Function(_SetAddressFromPlacesAPI) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? detail = null,
  }) {
    return _then(_SetAddressFromPlacesAPI(
      null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Place,
    ));
  }
}

/// @nodoc

class _SetMapController with DiagnosticableTreeMixin implements BusinessEvent {
  const _SetMapController(this.controller);

  final GoogleMapController controller;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetMapControllerCopyWith<_SetMapController> get copyWith =>
      __$SetMapControllerCopyWithImpl<_SetMapController>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.setMapController'))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetMapController &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setMapController(controller: $controller)';
  }
}

/// @nodoc
abstract mixin class _$SetMapControllerCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetMapControllerCopyWith(
          _SetMapController value, $Res Function(_SetMapController) _then) =
      __$SetMapControllerCopyWithImpl;
  @useResult
  $Res call({GoogleMapController controller});
}

/// @nodoc
class __$SetMapControllerCopyWithImpl<$Res>
    implements _$SetMapControllerCopyWith<$Res> {
  __$SetMapControllerCopyWithImpl(this._self, this._then);

  final _SetMapController _self;
  final $Res Function(_SetMapController) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? controller = null,
  }) {
    return _then(_SetMapController(
      null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
    ));
  }
}

/// @nodoc

class _UpdateBusiness with DiagnosticableTreeMixin implements BusinessEvent {
  const _UpdateBusiness();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.updateBusiness'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _UpdateBusiness);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.updateBusiness()';
  }
}

/// @nodoc

class _ToggleAllowReservations
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _ToggleAllowReservations(this.value);

  final bool value;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleAllowReservationsCopyWith<_ToggleAllowReservations> get copyWith =>
      __$ToggleAllowReservationsCopyWithImpl<_ToggleAllowReservations>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'BusinessEvent.toggleAllowReservations'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleAllowReservations &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.toggleAllowReservations(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ToggleAllowReservationsCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$ToggleAllowReservationsCopyWith(_ToggleAllowReservations value,
          $Res Function(_ToggleAllowReservations) _then) =
      __$ToggleAllowReservationsCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$ToggleAllowReservationsCopyWithImpl<$Res>
    implements _$ToggleAllowReservationsCopyWith<$Res> {
  __$ToggleAllowReservationsCopyWithImpl(this._self, this._then);

  final _ToggleAllowReservations _self;
  final $Res Function(_ToggleAllowReservations) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_ToggleAllowReservations(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SetReservationSizeLimit
    with DiagnosticableTreeMixin
    implements BusinessEvent {
  const _SetReservationSizeLimit(this.value);

  final int value;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetReservationSizeLimitCopyWith<_SetReservationSizeLimit> get copyWith =>
      __$SetReservationSizeLimitCopyWithImpl<_SetReservationSizeLimit>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'BusinessEvent.setReservationSizeLimit'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetReservationSizeLimit &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.setReservationSizeLimit(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$SetReservationSizeLimitCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$SetReservationSizeLimitCopyWith(_SetReservationSizeLimit value,
          $Res Function(_SetReservationSizeLimit) _then) =
      __$SetReservationSizeLimitCopyWithImpl;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$SetReservationSizeLimitCopyWithImpl<$Res>
    implements _$SetReservationSizeLimitCopyWith<$Res> {
  __$SetReservationSizeLimitCopyWithImpl(this._self, this._then);

  final _SetReservationSizeLimit _self;
  final $Res Function(_SetReservationSizeLimit) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_SetReservationSizeLimit(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ToggleMenuEnabled with DiagnosticableTreeMixin implements BusinessEvent {
  const _ToggleMenuEnabled(this.value);

  final bool value;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleMenuEnabledCopyWith<_ToggleMenuEnabled> get copyWith =>
      __$ToggleMenuEnabledCopyWithImpl<_ToggleMenuEnabled>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessEvent.toggleMenuEnabled'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleMenuEnabled &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessEvent.toggleMenuEnabled(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$ToggleMenuEnabledCopyWith<$Res>
    implements $BusinessEventCopyWith<$Res> {
  factory _$ToggleMenuEnabledCopyWith(
          _ToggleMenuEnabled value, $Res Function(_ToggleMenuEnabled) _then) =
      __$ToggleMenuEnabledCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$ToggleMenuEnabledCopyWithImpl<$Res>
    implements _$ToggleMenuEnabledCopyWith<$Res> {
  __$ToggleMenuEnabledCopyWithImpl(this._self, this._then);

  final _ToggleMenuEnabled _self;
  final $Res Function(_ToggleMenuEnabled) _then;

  /// Create a copy of BusinessEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_ToggleMenuEnabled(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$BusinessState implements DiagnosticableTreeMixin {
  BusinessVM get vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessStateCopyWith<BusinessState> get copyWith =>
      _$BusinessStateCopyWithImpl<BusinessState>(
          this as BusinessState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessState &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class $BusinessStateCopyWith<$Res> {
  factory $BusinessStateCopyWith(
          BusinessState value, $Res Function(BusinessState) _then) =
      _$BusinessStateCopyWithImpl;
  @useResult
  $Res call({BusinessVM vm});

  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class _$BusinessStateCopyWithImpl<$Res>
    implements $BusinessStateCopyWith<$Res> {
  _$BusinessStateCopyWithImpl(this._self, this._then);

  final BusinessState _self;
  final $Res Function(BusinessState) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vm = null,
  }) {
    return _then(_self.copyWith(
      vm: null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BusinessState].
extension BusinessStatePatterns on BusinessState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_UpdatingLogo value)? updatingLogo,
    TResult Function(_UpdatingMenu value)? updatingMenu,
    TResult Function(_UpdatingPictures value)? updatingPictures,
    TResult Function(_PicturesUpdated value)? picturesUpdated,
    TResult Function(_PictureDeleted value)? pictureDeleted,
    TResult Function(_EditLocation value)? editLocation,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ShowCoverImagesDialog value)? showCoverImagesDialog,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _UpdatingLogo() when updatingLogo != null:
        return updatingLogo(_that);
      case _UpdatingMenu() when updatingMenu != null:
        return updatingMenu(_that);
      case _UpdatingPictures() when updatingPictures != null:
        return updatingPictures(_that);
      case _PicturesUpdated() when picturesUpdated != null:
        return picturesUpdated(_that);
      case _PictureDeleted() when pictureDeleted != null:
        return pictureDeleted(_that);
      case _EditLocation() when editLocation != null:
        return editLocation(_that);
      case _LocationUpdated() when locationUpdated != null:
        return locationUpdated(_that);
      case _ShowCoverImagesDialog() when showCoverImagesDialog != null:
        return showCoverImagesDialog(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdatingLogo value) updatingLogo,
    required TResult Function(_UpdatingMenu value) updatingMenu,
    required TResult Function(_UpdatingPictures value) updatingPictures,
    required TResult Function(_PicturesUpdated value) picturesUpdated,
    required TResult Function(_PictureDeleted value) pictureDeleted,
    required TResult Function(_EditLocation value) editLocation,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ShowCoverImagesDialog value)
        showCoverImagesDialog,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
      case _UpdatingLogo():
        return updatingLogo(_that);
      case _UpdatingMenu():
        return updatingMenu(_that);
      case _UpdatingPictures():
        return updatingPictures(_that);
      case _PicturesUpdated():
        return picturesUpdated(_that);
      case _PictureDeleted():
        return pictureDeleted(_that);
      case _EditLocation():
        return editLocation(_that);
      case _LocationUpdated():
        return locationUpdated(_that);
      case _ShowCoverImagesDialog():
        return showCoverImagesDialog(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdatingLogo value)? updatingLogo,
    TResult? Function(_UpdatingMenu value)? updatingMenu,
    TResult? Function(_UpdatingPictures value)? updatingPictures,
    TResult? Function(_PicturesUpdated value)? picturesUpdated,
    TResult? Function(_PictureDeleted value)? pictureDeleted,
    TResult? Function(_EditLocation value)? editLocation,
    TResult? Function(_LocationUpdated value)? locationUpdated,
    TResult? Function(_ShowCoverImagesDialog value)? showCoverImagesDialog,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _UpdatingLogo() when updatingLogo != null:
        return updatingLogo(_that);
      case _UpdatingMenu() when updatingMenu != null:
        return updatingMenu(_that);
      case _UpdatingPictures() when updatingPictures != null:
        return updatingPictures(_that);
      case _PicturesUpdated() when picturesUpdated != null:
        return picturesUpdated(_that);
      case _PictureDeleted() when pictureDeleted != null:
        return pictureDeleted(_that);
      case _EditLocation() when editLocation != null:
        return editLocation(_that);
      case _LocationUpdated() when locationUpdated != null:
        return locationUpdated(_that);
      case _ShowCoverImagesDialog() when showCoverImagesDialog != null:
        return showCoverImagesDialog(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BusinessVM vm)? initial,
    TResult Function(BusinessVM vm)? loading,
    TResult Function(BusinessVM vm)? loaded,
    TResult Function(String msg, BusinessVM vm)? error,
    TResult Function(BusinessVM vm)? updatingLogo,
    TResult Function(BusinessVM vm)? updatingMenu,
    TResult Function(BusinessVM vm)? updatingPictures,
    TResult Function(BusinessVM vm)? picturesUpdated,
    TResult Function(BusinessVM vm)? pictureDeleted,
    TResult Function(BusinessVM vm)? editLocation,
    TResult Function(BusinessVM vm)? locationUpdated,
    TResult Function(BusinessVM vm)? showCoverImagesDialog,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _UpdatingLogo() when updatingLogo != null:
        return updatingLogo(_that.vm);
      case _UpdatingMenu() when updatingMenu != null:
        return updatingMenu(_that.vm);
      case _UpdatingPictures() when updatingPictures != null:
        return updatingPictures(_that.vm);
      case _PicturesUpdated() when picturesUpdated != null:
        return picturesUpdated(_that.vm);
      case _PictureDeleted() when pictureDeleted != null:
        return pictureDeleted(_that.vm);
      case _EditLocation() when editLocation != null:
        return editLocation(_that.vm);
      case _LocationUpdated() when locationUpdated != null:
        return locationUpdated(_that.vm);
      case _ShowCoverImagesDialog() when showCoverImagesDialog != null:
        return showCoverImagesDialog(_that.vm);
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
  TResult when<TResult extends Object?>({
    required TResult Function(BusinessVM vm) initial,
    required TResult Function(BusinessVM vm) loading,
    required TResult Function(BusinessVM vm) loaded,
    required TResult Function(String msg, BusinessVM vm) error,
    required TResult Function(BusinessVM vm) updatingLogo,
    required TResult Function(BusinessVM vm) updatingMenu,
    required TResult Function(BusinessVM vm) updatingPictures,
    required TResult Function(BusinessVM vm) picturesUpdated,
    required TResult Function(BusinessVM vm) pictureDeleted,
    required TResult Function(BusinessVM vm) editLocation,
    required TResult Function(BusinessVM vm) locationUpdated,
    required TResult Function(BusinessVM vm) showCoverImagesDialog,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.vm);
      case _Loading():
        return loading(_that.vm);
      case _Loaded():
        return loaded(_that.vm);
      case _Error():
        return error(_that.msg, _that.vm);
      case _UpdatingLogo():
        return updatingLogo(_that.vm);
      case _UpdatingMenu():
        return updatingMenu(_that.vm);
      case _UpdatingPictures():
        return updatingPictures(_that.vm);
      case _PicturesUpdated():
        return picturesUpdated(_that.vm);
      case _PictureDeleted():
        return pictureDeleted(_that.vm);
      case _EditLocation():
        return editLocation(_that.vm);
      case _LocationUpdated():
        return locationUpdated(_that.vm);
      case _ShowCoverImagesDialog():
        return showCoverImagesDialog(_that.vm);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BusinessVM vm)? initial,
    TResult? Function(BusinessVM vm)? loading,
    TResult? Function(BusinessVM vm)? loaded,
    TResult? Function(String msg, BusinessVM vm)? error,
    TResult? Function(BusinessVM vm)? updatingLogo,
    TResult? Function(BusinessVM vm)? updatingMenu,
    TResult? Function(BusinessVM vm)? updatingPictures,
    TResult? Function(BusinessVM vm)? picturesUpdated,
    TResult? Function(BusinessVM vm)? pictureDeleted,
    TResult? Function(BusinessVM vm)? editLocation,
    TResult? Function(BusinessVM vm)? locationUpdated,
    TResult? Function(BusinessVM vm)? showCoverImagesDialog,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.vm);
      case _Loading() when loading != null:
        return loading(_that.vm);
      case _Loaded() when loaded != null:
        return loaded(_that.vm);
      case _Error() when error != null:
        return error(_that.msg, _that.vm);
      case _UpdatingLogo() when updatingLogo != null:
        return updatingLogo(_that.vm);
      case _UpdatingMenu() when updatingMenu != null:
        return updatingMenu(_that.vm);
      case _UpdatingPictures() when updatingPictures != null:
        return updatingPictures(_that.vm);
      case _PicturesUpdated() when picturesUpdated != null:
        return picturesUpdated(_that.vm);
      case _PictureDeleted() when pictureDeleted != null:
        return pictureDeleted(_that.vm);
      case _EditLocation() when editLocation != null:
        return editLocation(_that.vm);
      case _LocationUpdated() when locationUpdated != null:
        return locationUpdated(_that.vm);
      case _ShowCoverImagesDialog() when showCoverImagesDialog != null:
        return showCoverImagesDialog(_that.vm);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements BusinessState {
  const _Initial(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.initial'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.initial(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Initial(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loading with DiagnosticableTreeMixin implements BusinessState {
  const _Loading(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.loading'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.loading(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Loading(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Loaded with DiagnosticableTreeMixin implements BusinessState {
  const _Loaded(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.loaded'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.loaded(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_Loaded(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements BusinessState {
  const _Error(this.msg, this.vm);

  final String msg;
  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.error'))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.error(msg: $msg, vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String msg, BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? msg = null,
    Object? vm = null,
  }) {
    return _then(_Error(
      null == msg
          ? _self.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _UpdatingLogo with DiagnosticableTreeMixin implements BusinessState {
  const _UpdatingLogo(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatingLogoCopyWith<_UpdatingLogo> get copyWith =>
      __$UpdatingLogoCopyWithImpl<_UpdatingLogo>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.updatingLogo'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatingLogo &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.updatingLogo(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UpdatingLogoCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$UpdatingLogoCopyWith(
          _UpdatingLogo value, $Res Function(_UpdatingLogo) _then) =
      __$UpdatingLogoCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UpdatingLogoCopyWithImpl<$Res>
    implements _$UpdatingLogoCopyWith<$Res> {
  __$UpdatingLogoCopyWithImpl(this._self, this._then);

  final _UpdatingLogo _self;
  final $Res Function(_UpdatingLogo) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_UpdatingLogo(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _UpdatingMenu with DiagnosticableTreeMixin implements BusinessState {
  const _UpdatingMenu(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatingMenuCopyWith<_UpdatingMenu> get copyWith =>
      __$UpdatingMenuCopyWithImpl<_UpdatingMenu>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.updatingMenu'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatingMenu &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.updatingMenu(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UpdatingMenuCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$UpdatingMenuCopyWith(
          _UpdatingMenu value, $Res Function(_UpdatingMenu) _then) =
      __$UpdatingMenuCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UpdatingMenuCopyWithImpl<$Res>
    implements _$UpdatingMenuCopyWith<$Res> {
  __$UpdatingMenuCopyWithImpl(this._self, this._then);

  final _UpdatingMenu _self;
  final $Res Function(_UpdatingMenu) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_UpdatingMenu(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _UpdatingPictures with DiagnosticableTreeMixin implements BusinessState {
  const _UpdatingPictures(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatingPicturesCopyWith<_UpdatingPictures> get copyWith =>
      __$UpdatingPicturesCopyWithImpl<_UpdatingPictures>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.updatingPictures'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatingPictures &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.updatingPictures(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$UpdatingPicturesCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$UpdatingPicturesCopyWith(
          _UpdatingPictures value, $Res Function(_UpdatingPictures) _then) =
      __$UpdatingPicturesCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$UpdatingPicturesCopyWithImpl<$Res>
    implements _$UpdatingPicturesCopyWith<$Res> {
  __$UpdatingPicturesCopyWithImpl(this._self, this._then);

  final _UpdatingPictures _self;
  final $Res Function(_UpdatingPictures) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_UpdatingPictures(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _PicturesUpdated with DiagnosticableTreeMixin implements BusinessState {
  const _PicturesUpdated(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PicturesUpdatedCopyWith<_PicturesUpdated> get copyWith =>
      __$PicturesUpdatedCopyWithImpl<_PicturesUpdated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.picturesUpdated'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PicturesUpdated &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.picturesUpdated(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$PicturesUpdatedCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$PicturesUpdatedCopyWith(
          _PicturesUpdated value, $Res Function(_PicturesUpdated) _then) =
      __$PicturesUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$PicturesUpdatedCopyWithImpl<$Res>
    implements _$PicturesUpdatedCopyWith<$Res> {
  __$PicturesUpdatedCopyWithImpl(this._self, this._then);

  final _PicturesUpdated _self;
  final $Res Function(_PicturesUpdated) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_PicturesUpdated(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _PictureDeleted with DiagnosticableTreeMixin implements BusinessState {
  const _PictureDeleted(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PictureDeletedCopyWith<_PictureDeleted> get copyWith =>
      __$PictureDeletedCopyWithImpl<_PictureDeleted>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.pictureDeleted'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PictureDeleted &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.pictureDeleted(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$PictureDeletedCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$PictureDeletedCopyWith(
          _PictureDeleted value, $Res Function(_PictureDeleted) _then) =
      __$PictureDeletedCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$PictureDeletedCopyWithImpl<$Res>
    implements _$PictureDeletedCopyWith<$Res> {
  __$PictureDeletedCopyWithImpl(this._self, this._then);

  final _PictureDeleted _self;
  final $Res Function(_PictureDeleted) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_PictureDeleted(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _EditLocation with DiagnosticableTreeMixin implements BusinessState {
  const _EditLocation(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditLocationCopyWith<_EditLocation> get copyWith =>
      __$EditLocationCopyWithImpl<_EditLocation>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.editLocation'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditLocation &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.editLocation(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$EditLocationCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$EditLocationCopyWith(
          _EditLocation value, $Res Function(_EditLocation) _then) =
      __$EditLocationCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$EditLocationCopyWithImpl<$Res>
    implements _$EditLocationCopyWith<$Res> {
  __$EditLocationCopyWithImpl(this._self, this._then);

  final _EditLocation _self;
  final $Res Function(_EditLocation) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_EditLocation(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _LocationUpdated with DiagnosticableTreeMixin implements BusinessState {
  const _LocationUpdated(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationUpdatedCopyWith<_LocationUpdated> get copyWith =>
      __$LocationUpdatedCopyWithImpl<_LocationUpdated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.locationUpdated'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationUpdated &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.locationUpdated(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$LocationUpdatedCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$LocationUpdatedCopyWith(
          _LocationUpdated value, $Res Function(_LocationUpdated) _then) =
      __$LocationUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$LocationUpdatedCopyWithImpl<$Res>
    implements _$LocationUpdatedCopyWith<$Res> {
  __$LocationUpdatedCopyWithImpl(this._self, this._then);

  final _LocationUpdated _self;
  final $Res Function(_LocationUpdated) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_LocationUpdated(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

/// @nodoc

class _ShowCoverImagesDialog
    with DiagnosticableTreeMixin
    implements BusinessState {
  const _ShowCoverImagesDialog(this.vm);

  @override
  final BusinessVM vm;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowCoverImagesDialogCopyWith<_ShowCoverImagesDialog> get copyWith =>
      __$ShowCoverImagesDialogCopyWithImpl<_ShowCoverImagesDialog>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'BusinessState.showCoverImagesDialog'))
      ..add(DiagnosticsProperty('vm', vm));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowCoverImagesDialog &&
            (identical(other.vm, vm) || other.vm == vm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vm);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessState.showCoverImagesDialog(vm: $vm)';
  }
}

/// @nodoc
abstract mixin class _$ShowCoverImagesDialogCopyWith<$Res>
    implements $BusinessStateCopyWith<$Res> {
  factory _$ShowCoverImagesDialogCopyWith(_ShowCoverImagesDialog value,
          $Res Function(_ShowCoverImagesDialog) _then) =
      __$ShowCoverImagesDialogCopyWithImpl;
  @override
  @useResult
  $Res call({BusinessVM vm});

  @override
  $BusinessVMCopyWith<$Res> get vm;
}

/// @nodoc
class __$ShowCoverImagesDialogCopyWithImpl<$Res>
    implements _$ShowCoverImagesDialogCopyWith<$Res> {
  __$ShowCoverImagesDialogCopyWithImpl(this._self, this._then);

  final _ShowCoverImagesDialog _self;
  final $Res Function(_ShowCoverImagesDialog) _then;

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vm = null,
  }) {
    return _then(_ShowCoverImagesDialog(
      null == vm
          ? _self.vm
          : vm // ignore: cast_nullable_to_non_nullable
              as BusinessVM,
    ));
  }

  /// Create a copy of BusinessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessVMCopyWith<$Res> get vm {
    return $BusinessVMCopyWith<$Res>(_self.vm, (value) {
      return _then(_self.copyWith(vm: value));
    });
  }
}

// dart format on
