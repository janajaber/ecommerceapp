// models.dart

// models.dart
class Shoe {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Shoe(
      {required this.name,
      required this.description,
      required this.imageUrl,
      required this.price});
}

class Cart {
  List<Shoe> _items = [];

  List<Shoe> get items => _items;

  void addItem(Shoe shoe) {
    _items.add(shoe);
  }

  void removeItem(Shoe shoe) {
    _items.remove(shoe);
  }

  // Add totalPrice getter
  double get totalPrice {
    return _items.fold(0, (double sum, Shoe shoe) => sum + shoe.price);
  }
}
