import '../../../services/state_tools/store/exports.dart';
import '../models/product_model.dart';
import '../product_store.dart';

class ProductDetailsViewModel {
  final globalStore = ProductStore.instance;
  final store = StoreData<ProductModel?>.create(null);

  Future<bool> getData(String productId) async {
    store.activateLoading;
    await Future.delayed(Duration(milliseconds: 500));
    store.deactivateLoading;

    store.data = globalStore.productList.get(productId);
    return true;
  }
}
