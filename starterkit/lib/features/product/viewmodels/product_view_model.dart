import '../../../shared/models/api_response.dart';
import '../mock_api.dart';
import '../models/product_model.dart';
import '../product_store.dart';

class ProductViewModel {
  final store = ProductStore.instance;

  final mainPath = '/products';
  final limit = 8;
  String? _after;

  /// 0: Continues - 1: Finished
  Future<int> getList({String? after}) async {
    if (after != null && _after == after) return 1;
    _after = after;

    store.productList.activateLoading;
    // final r = await apiService.get(
    //   path: mainPath,
    //   params: {"limit": limit, "after": after},
    // );
    await Future.delayed(Duration(seconds: 1));
    final r = MockApi().getProductList(limit: limit, after: after);
    store.productList.deactivateLoading;

    final res = ApiResponse.fromMap(r).checkData();
    if (res.hasError != false) return 1;
    final newData = ProductModel.dataToModelList(res.data);
    if (newData.isEmpty) return 1;

    if (after == null) store.productList.clear();
    store.productList.addAll(newData);

    if (newData.length < limit) _after = newData.last.id;
    return newData.length < limit ? 1 : 0;
  }
}
