part of '../user_profile_page.dart';

class _UserReviews extends StatefulWidget {
  const _UserReviews({super.key});

  @override
  State<_UserReviews> createState() => _UserReviewsState();
}

class _UserReviewsState extends State<_UserReviews> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<UserProfileCubit>().loadMoreReviews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserProfileCubit, UserProfileState,
        ({List<ReviewDM> reviews, bool isLoadingMore, bool canLoadMore})>(
      selector: (state) => (
        reviews: state.vm.myReviews,
        isLoadingMore: state.vm.isLoadingMoreReviews,
        canLoadMore: state.vm.canLoadMoreReviews,
      ),
      builder: (context, data) {
        if (data.reviews.isEmpty) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Asset(FoodlyAssets.noCustomerReviewsYet, width: 40),
              Flexible(
                child: Text(
                  S.current.userReviewsPlaceholder,
                  textAlign: TextAlign.center,
                  style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                ).paddingTop(8),
              ),
            ],
          ).paddingVertical(16);
        }

        return CarouselSlider(
          key: const Key('user-profile-reviews-carousel-slider'),
          options: CarouselOptions(
            height: 290,
            enableInfiniteScroll: false,
            viewportFraction: 0.93,
            enlargeCenterPage: true,
            enlargeFactor: .26,
            onPageChanged: (index, _) {
              if (index >= data.reviews.length - 3 && data.canLoadMore && !data.isLoadingMore) {
                context.read<UserProfileCubit>().loadMoreReviews();
              }
            },
          ),
          items: [
            ...data.reviews.map((review) {
              return ReviewCard(review: review);
            }),
            if (data.isLoadingMore)
              const Center(
                child: SizedBox.square(
                  dimension: 36,
                  child: CircularProgressIndicator.adaptive(
                      strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(FoodlyThemes.primaryFoodly)),
                ),
              ),
          ],
        );
      },
    );
  }
}
