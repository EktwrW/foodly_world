import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;
import 'package:foodly_world/core/core_exports.dart'
    show NotificationsCubit, NotificationsState, FoodlyThemes, ReadContext, di, DialogService, PaddingExtension;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryMainAppBar(
        key: Key('notifications-app-bar'),
        actionText: 'Notifications',
      ),
      body: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          final dialogService = di<DialogService>();

          state.whenOrNull(
            loading: (vm) => dialogService.showLoading(),
            loaded: (vm) => dialogService.hideLoading(),
            error: (vm, message) {
              dialogService.hideLoading();
              FoodlySnackbars.errorGeneric(context, message);
            },
          );
        },
        builder: (context, state) {
          final vm = state.vm;

          if (vm.notifications.isEmpty) {
            return const Center(
              child: Column(
                spacing: 16,
                children: [
                  Text('No notifications yet!'),
                ],
              ),
            );
          }

          return Column(
            spacing: 16,
            children: [
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: CustomNeumorphicButton(
                    onPressed: () => context.read<NotificationsCubit>().markAllAsRead(),
                    type: CustomNeumorphicBtnType.secondary,
                    text: 'Mark all as read',
                    fontSize: 14,
                    disabled: !vm.hasUnread,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: vm.notifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final notification = vm.notifications[index];

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: notification.isRead
                            ? []
                            : [
                                BoxShadow(
                                  color: FoodlyThemes.primaryFoodly.withValues(alpha: .14),
                                  blurRadius: 6,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                      ),
                      child: ListTile(
                        onTap: () {
                          context.read<NotificationsCubit>().markAsRead(notification.uuid);
                        },
                        leading: AvatarWidget(
                          avatarUrl: notification.actorPhotoUrl,
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          notification.title,
                          style: FoodlyTextStyles.labelBold,
                        ),
                        subtitle: Column(
                          spacing: 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notification.message, style: FoodlyTextStyles.label).paddingTop(2),
                            Row(
                              spacing: 6,
                              children: [
                                Icon(notification.type?.icon ?? Bootstrap.bell,
                                    size: 16, color: FoodlyThemes.primaryFoodly),
                                Text(notification.createdAt?.timeAgo ?? '', style: FoodlyTextStyles.captionPurple),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: () => context.read<NotificationsCubit>().markAsRead(notification.uuid),
                                splashFactory: InkRipple.splashFactory,
                                customBorder: const CircleBorder(),
                                child: const Icon(Bootstrap.check2, size: 24),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () => context.read<NotificationsCubit>().deleteNotification(notification.uuid),
                                splashFactory: InkRipple.splashFactory,
                                customBorder: const CircleBorder(),
                                child: const Icon(Bootstrap.trash, size: 20),
                              ),
                            ),
                          ],
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 4, 14, 4),
                        tileColor: notification.isRead ? Colors.white : FoodlyThemes.primaryLighten73,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enableFeedback: !notification.isRead,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
