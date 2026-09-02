import 'dart:convert';

import '../../../shared/models/base_model.dart';

class ProductModel extends BaseModel {
  final String title;
  final String description;
  final String? imageUrl;
  final double price;

  ProductModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.price,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      createdAt: (map['createdAt'] as String?)?.toDateLocal,
      updatedAt: (map['updatedAt'] as String?)?.toDateLocal,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'],
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  static List<ProductModel> dataToModelList(List dataList) {
    return dataList.map((e) => ProductModel.fromMap(e)).toList();
  }
}
