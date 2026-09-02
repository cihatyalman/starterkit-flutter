import 'dart:convert';

import 'product_model.dart';

class NewProductModel {
  String? title;
  String? description;
  String? imageUrl;
  double? price;

  NewProductModel({this.title, this.description, this.imageUrl, this.price});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory NewProductModel.fromMap(Map<String, dynamic> map) {
    return NewProductModel(
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewProductModel.fromJson(String source) =>
      NewProductModel.fromMap(json.decode(source));

  factory NewProductModel.fromModel(ProductModel model) =>
      NewProductModel.fromMap(model.toMap());
}
