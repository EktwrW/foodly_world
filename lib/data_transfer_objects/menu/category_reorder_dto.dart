class CategoryReorderDTO {
  final String uuid;
  final int sortOrder;

  const CategoryReorderDTO({required this.uuid, required this.sortOrder});

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'sort_order': sortOrder,
      };
}

class ReorderCategoriesDTO {
  final List<CategoryReorderDTO> categories;

  const ReorderCategoriesDTO({required this.categories});

  Map<String, dynamic> toJson() => {
        'categories': categories.map((e) => e.toJson()).toList(),
      };
}
