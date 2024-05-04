import 'package:flutter/material.dart' show GlobalKey, ScaffoldState;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_drawer_vm.freezed.dart';

@freezed
class MainDrawerVM with _$MainDrawerVM {
  const MainDrawerVM._();

  const factory MainDrawerVM({
    @Default('') String avatarUrl,
    GlobalKey<ScaffoldState>? scaffoldKey,
  }) = _MainDrawerVM;
}
