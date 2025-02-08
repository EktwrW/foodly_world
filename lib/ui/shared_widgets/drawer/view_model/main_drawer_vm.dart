import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sidebarx/sidebarx.dart' show SidebarXController;

part 'main_drawer_vm.freezed.dart';

@freezed
class MainDrawerVM with _$MainDrawerVM {
  const MainDrawerVM._();

  const factory MainDrawerVM({
    required SidebarXController sidebarController,
    @Default([0]) List<int> indexHistory,
  }) = _MainDrawerVM;

  bool get canGoBack => indexHistory.length > 1;
  int get currentIndex => indexHistory.last;
}
