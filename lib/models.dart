// models.dart

// models.dart
class Shoe {
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final List<String> imageUrls;

  Shoe({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.imageUrls,
  });
}

class Cart {
  List<Shoe> _items = [];

  List<Shoe> get items => _items;

  get selectedSize => null;

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
