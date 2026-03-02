part of '../../manage_promotions_page.dart';

class PromotionCard extends StatefulWidget {
  final PromotionDM promo;
  final Size? size;

  const PromotionCard({super.key, required this.promo, this.size});

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(right: 12, left: 12, bottom: 30),
      child: ui.NeumorphicButton(
        padding: EdgeInsets.zero,
        style: const ui.NeumorphicStyle(
            shape: ui.NeumorphicShape.concave, color: ui.NeumorphicColors.decorationMaxWhiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: widget.promo.mediaFileUrl.isNotEmpty
                          ? PromoMedia(
                              externalUrl: widget.promo.mediaLink ?? '',
                              promoMedia: widget.promo.mediaFileIsExternalLink ? null : widget.promo.promoMedia.first,
                              title: widget.promo.title,
                            )
                          : const PromoPlaceholder(),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child:
                          _LikeOrEditWidget(key: Key('like-or-edit-promo: ${widget.promo.uuid}'), promo: widget.promo)),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      widget.promo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 17),
                    ).paddingVertical(20),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            TextSpan(
                              style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 14),
                              children: [
                                TextSpan(
                                  text: widget.promo.subTitle,
                                  style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 14),
                                ),
                                WidgetSpan(
                                  child: JelloIn(
                                    duration: Durations.extralong3,
                                    child: Icon(
                                      Bootstrap.megaphone_fill,
                                      color: Colors.green[700],
                                      size: 20,
                                    ).paddingOnly(left: 10),
                                  ),
                                )
                              ],
                            ),
                          ).paddingHorizontal(20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.promo.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 20,
                      style: FoodlyTextStyles.primaryBodySemiBoldBlack,
                    ).paddingVertical(24),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Pulse(
                                  delay: Durations.extralong4,
                                  child: const Icon(Bootstrap.calendar2_check, color: FoodlyThemes.tertiaryFoodly)),
                              Text(
                                toBeginningOfSentenceCase(widget.promo.startDate.getStringFormat),
                                textAlign: TextAlign.center,
                                style: FoodlyTextStyles.primaryBodyBold,
                              ).paddingTop(6),
                            ],
                          ).paddingRight(4),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Pulse(
                                  delay: const Duration(milliseconds: 1800),
                                  child: const Icon(Bootstrap.calendar2_minus, color: FoodlyThemes.error)),
                              Text(
                                toBeginningOfSentenceCase(widget.promo.expireDate.getStringFormat),
                                textAlign: TextAlign.center,
                                style: FoodlyTextStyles.primaryBodyBold,
                              ).paddingTop(6),
                            ],
                          ).paddingLeft(4),
                        ),
                      ],
                    ).paddingTop(12),
                  ),
                  if (widget.promo.promoDays.hasAnyDay)
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(S.current.valid, style: FoodlyTextStyles.primaryBodyBold).paddingBottom(10),
                          Flexible(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 12,
                              runSpacing: 12,
                              children: widget.promo.promoDays.activeDays
                                  .map(
                                    (day) => Container(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                      constraints: const BoxConstraints(minWidth: 54),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: FoodlyThemes.primaryFoodly,
                                      ),
                                      child: Text(
                                        day,
                                        textAlign: TextAlign.center,
                                        style: FoodlyTextStyles.captionWhiteBold,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ).paddingTop(24),
                    )
                  else
                    const SizedBox(height: UIDimens.SCREEN_PADDING_MOB)
                ],
              ).paddingHorizontal(UIDimens.SCREEN_PADDING_MOB),
            ),
            CustomRoundedNeumorphicButton(
              onPressed: () => SharePromotionHelper.share(widget.promo),
              shape: ui.NeumorphicShape.concave,
              tooltip: 'Share Promotion',
              iconSize: 24,
              diameter: 38,
              depth: 4,
              iconData: Bootstrap.send_fill,
            ).paddingVertical(20),
          ],
        ),
      ),
    );
  }
}

class PromoMedia extends StatelessWidget {
  final String externalUrl;
  final PromoMediaDM? promoMedia;
  final String? title;

  const PromoMedia({
    super.key,
    required this.externalUrl,
    required this.promoMedia,
    this.title,
  });

  bool get _mustPlayExternalLink => externalUrl.isNotEmpty;
  bool get _mustPlayVideo => !_mustPlayExternalLink && (promoMedia?.isVideo ?? false);

  @override
  Widget build(BuildContext context) {
    if (_mustPlayExternalLink) {
      return YouTubeVideoPlayer(url: externalUrl, videoTitle: title);
    } else if (_mustPlayVideo) {
      return NetworkVideoPlayer(url: promoMedia?.mediaUrl ?? '');
    } else {
      return FeedMultipleImageView(
        imageUrls: [promoMedia?.mediaUrl ?? ''],
        radius: 8,
      );
    }
  }
}

class PromoPlaceholder extends StatefulWidget {
  const PromoPlaceholder({super.key});

  @override
  State<PromoPlaceholder> createState() => _PromoPlaceholderState();
}

class _PromoPlaceholderState extends State<PromoPlaceholder> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _currentIconIndex = 0;

  static const List<IconData> _icons = [
    FontAwesome.gifts_solid,
    Bootstrap.ticket_perforated,
    Bootstrap.shop,
    Bootstrap.alarm,
    Bootstrap.percent,
    Bootstrap.cup_hot_fill,
    Bootstrap.gift_fill,
    Bootstrap.currency_dollar,
    Bootstrap.tag_fill,
    FontAwesome.utensils_solid,
    Clarity.savings_line,
    LineAwesome.gift_solid,
    LineAwesome.store_solid,
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => _currentIconIndex = (_currentIconIndex + 1) % _icons.length);
          _controller
            ..reset()
            ..forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
            FoodlyThemes.primaryFoodly.withValues(alpha: 0.05),
            FoodlyThemes.primaryFoodly.withValues(alpha: 0.01),
          ],
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scaleAnimation = Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOutBack,
            ));

            final opacityAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
            ));

            final fadeOutAnimation = Tween<double>(
              begin: 1.0,
              end: 0.0,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
            ));

            return ScaleTransition(
              scale: scaleAnimation,
              child: AnimatedOpacity(
                duration: Durations.medium3,
                opacity: opacityAnimation.value * fadeOutAnimation.value,
                child: Icon(
                  _icons[_currentIconIndex],
                  size: 80,
                  color: FoodlyThemes.tertiaryFoodly,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LikeOrEditWidget extends StatelessWidget {
  const _LikeOrEditWidget({
    super.key,
    required this.promo,
  });

  final PromotionDM promo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePromotionsCubit, ManagePromotionsState>(
      builder: (context, state) {
        final vm = state.vm;
        if (vm.loggedUserCanEdit) {
          return PopupMenuButton<String>(
            elevation: 3,
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: Colors.white70,
            onSelected: (value) {
              final cubit = context.read<ManagePromotionsCubit>();

              if (value == 'edit') {
                cubit
                  ..setControllers(promo: promo)
                  ..updateEditMode(PromotionEditing.title);

                if (vm.indexView != 1) {
                  vm.controller?.animateToPage(1, duration: Durations.short4, curve: Curves.decelerate);
                  cubit.updateView(1);
                }
              }

              if (value == 'delete') {
                cubit.deletePromotion(promo.uuid);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    const Icon(Bootstrap.pencil_square, color: FoodlyThemes.primaryFoodly),
                    Text(S.current.edit).paddingLeft(14)
                  ],
                ),
              ),
              if (promo.uuid.isNotEmpty)
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Bootstrap.trash3, color: FoodlyThemes.primaryFoodly),
                      Text(S.current.delete).paddingLeft(14)
                    ],
                  ),
                ),
            ],
          );
        }

        return FavoriteButton.forPromotion(
          key: Key(promo.uuid),
          diameter: 28,
          iconSize: 16,
          promotion: promo,
        );
      },
    );
  }
}
