class ItemReorderDTO {
  final String uuid;
  final int sortOrder;

  const ItemReorderDTO({required this.uuid, required this.sortOrder});

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'sort_order': sortOrder,
      };
}

class ReorderItemsDTO {
  final List<ItemReorderDTO> items;

  const ReorderItemsDTO({required this.items});

  Map<String, dynamic> toJson() => {
        'items': items.map((e) => e.toJson()).toList(),
      };
}
