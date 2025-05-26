// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foundation_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoundationCategory _$FoundationCategoryFromJson(Map<String, dynamic> json) =>
    FoundationCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FoundationCategoryToJson(FoundationCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  shades: (json['shades'] as List<dynamic>).map((e) => e as String).toList(),
  price: (json['price'] as num).toDouble(),
  brand: json['brand'] as String,
  categoryId: json['categoryId'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'shades': instance.shades,
  'price': instance.price,
  'brand': instance.brand,
  'categoryId': instance.categoryId,
  'tags': instance.tags,
};
