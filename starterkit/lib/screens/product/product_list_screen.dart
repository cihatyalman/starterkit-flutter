import 'package:flutter/material.dart';

import '../../features/product/exports.dart';
import '../../main.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_list.dart';
import 'product_edit_screen.dart';

class ProductListScreen extends StatelessWidget {
  static const route = 'ProductListScreen';
  ProductListScreen({super.key});

  final vm = ProductViewModel();

  void init() {
    vm.getList();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: CAppBar(
        title: "Ürünler",
        actions: [actionButton()],
      ).build(context),
      body: vm.store.productList.listen((dataList, isLoading) {
        return CList(
          physics: const ClampingScrollPhysics(),
          isLoading: isLoading,
          dataList: dataList,
          itemWidget: (item, index) => ProductItemWidget(data: item),
          onContinue: () => vm.getList(after: dataList.last.id),
        );
      }),
    );
  }

  Widget actionButton() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.add),
      ),
      onTap: () {
        navigatorKey.currentState?.pushNamed(ProductEditScreen.route).then((
          value,
        ) {
          if (value != null) {
            vm.store.productList.insert(0, value as ProductModel);
          }
        });
      },
    );
  }
}
