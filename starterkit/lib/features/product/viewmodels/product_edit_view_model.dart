import 'package:flutter/foundation.dart';

import '../models/new_product_model.dart';
import '../models/product_model.dart';

class ProductEditViewModel {
  final imageNotifier = ValueNotifier<String?>(null);
  NewProductModel updateData = NewProductModel();

  void getDataFromStore(ProductModel model) {
    updateData = NewProductModel.fromModel(model);
  }

  Future<ProductModel?> update() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (imageNotifier.value != null) {
      updateData.imageUrl = imageNotifier.value;
    }
    debugPrint("[C_update]: ${updateData.toMap()}");
    final newData = ProductModel.fromMap({
      "id": "1001",
      "image": updateData.imageUrl,
      "title": updateData.title,
      "description": updateData.description,
      "price": updateData.price,
    });
    return newData;
  }

  Future<ProductModel?> save() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (imageNotifier.value != null) {
      updateData.imageUrl = imageNotifier.value;
    }
    debugPrint("[C_save]: ${updateData.toMap()}");
    final newData = ProductModel.fromMap({
      "id": "1001",
      "image": updateData.imageUrl,
      "title": updateData.title,
      "description": updateData.description,
      "price": updateData.price,
    });

    return newData;
  }
}
