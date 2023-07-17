class StockItem {
  final int id;
  final String name;
  final String size;
  final String type;
  bool selected;

  StockItem({
    required this.id,
    required this.name,
    required this.size,
    required this.type,
    this.selected = false,
  });
}
