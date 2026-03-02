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

        final itemCount = data.reviews.length + (data.isLoadingMore ? 1 : 0);

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: data.reviews.length == 1 ? 310 : 600),
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            shrinkWrap: true,
            itemCount: itemCount,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              if (index >= data.reviews.length) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                ).paddingAll(16);
              }
              return ReviewCard(review: data.reviews[index]);
            },
          ),
        );
      },
    );
  }
}
