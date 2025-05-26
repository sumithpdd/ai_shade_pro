class FoundationCategory {
  final String id;
  final String name;
  final List<Product> products;

  FoundationCategory({
    required this.id,
    required this.name,
    this.products = const [],
  });
}

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> shades;
  final double price;
  final String brand;
  final String categoryId;
  final List<String> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.shades,
    required this.price,
    required this.brand,
    required this.categoryId,
    required this.tags,
  });
}
