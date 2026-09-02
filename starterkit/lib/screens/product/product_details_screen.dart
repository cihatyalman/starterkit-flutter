import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/product/exports.dart';
import '../../main.dart';
import '../../utils/helpers/widget_helper.dart';
import '../../widgets/custom/cached_image.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_text.dart';
import 'product_edit_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const route = 'ProductDetailsScreen';

  final RouteSettings settings;
  const ProductDetailsScreen({super.key, required this.settings});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? productId;

  final vm = ProductDetailsViewModel();

  @override
  void initState() {
    super.initState();

    productId = widget.settings.arguments as String?;
    if (productId != null) vm.getData(productId!);
  }

  @override
  void dispose() {
    vm.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: "Ürün Detay",
        actions: [if (productId != null) actionButton()],
      ).build(context),
      body: vm.store.listen((data, isLoading) {
        if (isLoading) return shimmerWidget();
        if (data == null) return hw.emptyWidget();
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(bottom: hw.edgePadding),
                child: Column(
                  spacing: hw.edgePadding,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageWidget(data),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hw.edgePadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [titleWidget(data), descriptionWidget(data)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BuyButton(product: data),
          ],
        );
      }),
    );
  }

  Widget imageWidget(ProductModel data) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: CachedImage(imageData: data.imageUrl, radius: 0),
    );
  }

  Widget titleWidget(ProductModel data) {
    return CText(
      data.title,
      isBold: true,
      size: 20,
      maxLines: 2,
      isOverflow: true,
    );
  }

  Widget descriptionWidget(ProductModel data) => CText(data.description);

  Widget actionButton() {
    return vm.store.listen((data, _) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.edit),
        ),
        onTap: () {
          navigatorKey.currentState
              ?.pushNamed(ProductEditScreen.route, arguments: data)
              .then((value) {
                if (value != null) {
                  vm.store.data = value as ProductModel;
                  vm.globalStore.productList.update(value);
                }
              });
        },
      );
    });
  }

  Widget shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        spacing: hw.edgePadding,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(width: double.infinity, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hw.edgePadding),
            child: Column(
              spacing: 8,
              children: [
                Container(height: 20, color: Colors.white),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Container(height: 12, color: Colors.white),
                    Container(height: 12, color: Colors.white),
                    Container(height: 12, width: 100, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
