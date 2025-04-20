import 'package:flutter/widgets.dart';
import 'package:foodly_world/data_models/business/business_dm.dart' show CategoryDM;
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';

extension CategoryExtension on CategoryDM {
  Widget get avatar => AvatarWidget(avatarUrl: categoryImagePath, boxFit: BoxFit.contain);
}
