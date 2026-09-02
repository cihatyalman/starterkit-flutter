import '../../services/state_tools/store/store_models.dart';
import 'models/product_model.dart';

class ProductStore {
  static final instance = ProductStore._internal();
  ProductStore._internal();

  final productList = StoreDataList<ProductModel>.create([]);

  void clear() {
    productList.clear();
  }
}
