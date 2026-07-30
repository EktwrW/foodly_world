// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_drawer_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainDrawerVM {
  SidebarXController get sidebarController;
  List<int> get indexHistory;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainDrawerVMCopyWith<MainDrawerVM> get copyWith =>
      _$MainDrawerVMCopyWithImpl<MainDrawerVM>(
          this as MainDrawerVM, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainDrawerVM &&
            (identical(other.sidebarController, sidebarController) ||
                other.sidebarController == sidebarController) &&
            const DeepCollectionEquality()
                .equals(other.indexHistory, indexHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sidebarController,
      const DeepCollectionEquality().hash(indexHistory));

  @override
  String toString() {
    return 'MainDrawerVM(sidebarController: $sidebarController, indexHistory: $indexHistory)';
  }
}

/// @nodoc
abstract mixin class $MainDrawerVMCopyWith<$Res> {
  factory $MainDrawerVMCopyWith(
          MainDrawerVM value, $Res Function(MainDrawerVM) _then) =
      _$MainDrawerVMCopyWithImpl;
  @useResult
  $Res call({SidebarXController sidebarController, List<int> indexHistory});
}

/// @nodoc
class _$MainDrawerVMCopyWithImpl<$Res> implements $MainDrawerVMCopyWith<$Res> {
  _$MainDrawerVMCopyWithImpl(this._self, this._then);

  final MainDrawerVM _self;
  final $Res Function(MainDrawerVM) _then;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sidebarController = null,
    Object? indexHistory = null,
  }) {
    return _then(_self.copyWith(
      sidebarController: null == sidebarController
          ? _self.sidebarController
          : sidebarController // ignore: cast_nullable_to_non_nullable
              as SidebarXController,
      indexHistory: null == indexHistory
          ? _self.indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MainDrawerVM].
extension MainDrawerVMPatterns on MainDrawerVM {
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
    TResult Function(_MainDrawerVM value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM() when $default != null:
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
    TResult Function(_MainDrawerVM value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM():
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
    TResult? Function(_MainDrawerVM value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM() when $default != null:
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
            SidebarXController sidebarController, List<int> indexHistory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM() when $default != null:
        return $default(_that.sidebarController, _that.indexHistory);
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
            SidebarXController sidebarController, List<int> indexHistory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM():
        return $default(_that.sidebarController, _that.indexHistory);
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
            SidebarXController sidebarController, List<int> indexHistory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MainDrawerVM() when $default != null:
        return $default(_that.sidebarController, _that.indexHistory);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MainDrawerVM extends MainDrawerVM {
  const _MainDrawerVM(
      {required this.sidebarController,
      final List<int> indexHistory = const [0]})
      : _indexHistory = indexHistory,
        super._();

  @override
  final SidebarXController sidebarController;
  final List<int> _indexHistory;
  @override
  @JsonKey()
  List<int> get indexHistory {
    if (_indexHistory is EqualUnmodifiableListView) return _indexHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_indexHistory);
  }

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MainDrawerVMCopyWith<_MainDrawerVM> get copyWith =>
      __$MainDrawerVMCopyWithImpl<_MainDrawerVM>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainDrawerVM &&
            (identical(other.sidebarController, sidebarController) ||
                other.sidebarController == sidebarController) &&
            const DeepCollectionEquality()
                .equals(other._indexHistory, _indexHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sidebarController,
      const DeepCollectionEquality().hash(_indexHistory));

  @override
  String toString() {
    return 'MainDrawerVM(sidebarController: $sidebarController, indexHistory: $indexHistory)';
  }
}

/// @nodoc
abstract mixin class _$MainDrawerVMCopyWith<$Res>
    implements $MainDrawerVMCopyWith<$Res> {
  factory _$MainDrawerVMCopyWith(
          _MainDrawerVM value, $Res Function(_MainDrawerVM) _then) =
      __$MainDrawerVMCopyWithImpl;
  @override
  @useResult
  $Res call({SidebarXController sidebarController, List<int> indexHistory});
}

/// @nodoc
class __$MainDrawerVMCopyWithImpl<$Res>
    implements _$MainDrawerVMCopyWith<$Res> {
  __$MainDrawerVMCopyWithImpl(this._self, this._then);

  final _MainDrawerVM _self;
  final $Res Function(_MainDrawerVM) _then;

  /// Create a copy of MainDrawerVM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sidebarController = null,
    Object? indexHistory = null,
  }) {
    return _then(_MainDrawerVM(
      sidebarController: null == sidebarController
          ? _self.sidebarController
          : sidebarController // ignore: cast_nullable_to_non_nullable
              as SidebarXController,
      indexHistory: null == indexHistory
          ? _self._indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

// dart format on
