part of './../../business_page.dart';

class CategoryWdg extends StatelessWidget {
  const CategoryWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return BlocSelector<BusinessBloc, BusinessState, BusinessVM>(selector: (state) {
      return state.vm;
    }, builder: (context, vm) {
      if (vm.isEditingCategory) {
        return Form(
          key: vm.categoryFormKey,
          autovalidateMode: vm.autovalidateMode,
          child: FadeIn(
            child: Column(
              children: [
                FoodlyDropdownButtonFormField<FoodlyCategories>(
                  onChanged: (FoodlyCategories? category) =>
                      category != null ? bloc.add(BusinessEvent.setCategory(category)) : null,
                  enabled: vm.isEditingCategory,
                  items: FoodlyCategories.values.map<DropdownMenuItem<FoodlyCategories>>((category) {
                    return DropdownMenuItem<FoodlyCategories>(
                      value: category,
                      child: Row(
                        children: [
                          SizedBox.square(dimension: 30, child: category.avatar).paddingSymmetric(horizontal: 10),
                          Text(category.text),
                        ],
                      ),
                    );
                  }).toList(),
                  value: vm.newCategory ?? vm.currentBusiness?.category?.id,
                  validatorText: S.current.pleaseSelectBusinessCategory,
                  hintText: S.current.businessCategory,
                ),
                SaveAndCancelButtons(
                  onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
                  onCancelPressed: () {
                    bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none));
                  },
                  showSaveButton: vm.newCategory != null && vm.newCategory != vm.currentBusiness?.category?.id,
                ),
              ],
            ).paddingRight(16),
          ),
        );
      }
      return FadeIn(
        child: MaterialButton(
          onPressed: () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.category)),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox.square(dimension: 30, child: vm.currentBusiness?.category?.avatar ?? const SizedBox.shrink()),
              Text(vm.currentBusiness?.category?.id?.text ?? '').paddingLeft(8),
            ],
          ),
        ),
      ).paddingRight(16);
    });
  }
}
