import 'package:json_annotation/json_annotation.dart';

part 'foundation_category.g.dart';

@JsonSerializable(explicitToJson: true)
class FoundationCategory {
  final String id;
  final String name;
  final List<Product> products;

  FoundationCategory({
    required this.id,
    required this.name,
    this.products = const [],
  });

  factory FoundationCategory.fromJson(Map<String, dynamic> json) =>
      _$FoundationCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$FoundationCategoryToJson(this);
}

@JsonSerializable()
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
