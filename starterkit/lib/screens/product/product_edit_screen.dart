import 'package:flutter/material.dart';

import '../../features/product/exports.dart';
import '../../main.dart';
import '../../shared/constants/text_constant.dart';
import '../../utils/helpers/widget_helper.dart';
import '../../widgets/custom/cached_image.dart';
import '../../widgets/custom/custom_button.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_input.dart';

class ProductEditScreen extends StatelessWidget {
  static const route = 'ProductEditScreen';

  final RouteSettings settings;
  ProductEditScreen({super.key, required this.settings});

  ProductModel? product;

  final vm = ProductEditViewModel();

  void init() {
    product = settings.arguments as ProductModel?;
    if (product != null) {
      vm.getDataFromStore(product!);
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    return Scaffold(
      appBar: CAppBar(
        title: product != null ? "Ürün Düzenle" : "Ürün Ekle",
      ).build(context),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(bottom: hw.edgePadding),
        child: Column(
          spacing: hw.edgePadding,
          children: [
            imageWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hw.edgePadding),
              child: formWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return ValueListenableBuilder<String?>(
      valueListenable: vm.imageNotifier,
      builder: (_, value, _) {
        return Stack(
          alignment: Alignment.bottomRight.add(Alignment(-.05, -.05)),
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: CachedImage(
                imageData: value ?? vm.updateData.imageUrl,
                radius: 0,
              ),
            ),
            IconButton.filled(
              icon: Icon(Icons.image),
              padding: EdgeInsets.all(12),
              onPressed: () {
                vm.imageNotifier.value = TextConstants.randomImageUrl;
              },
            ),
          ],
        );
      },
    );
  }

  Widget formWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        CInput(
          hintText: "Başlık",
          initialValue: vm.updateData.title,
          onChanged: (value) => vm.updateData.title = value,
        ),
        CInput(
          hintText: "Açıklama",
          maxLines: 6,
          keyboardType: TextInputType.multiline,
          initialValue: vm.updateData.description,
          onChanged: (value) => vm.updateData.description = value,
        ),
        CInput(
          hintText: "Fiyat",
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          initialValue: vm.updateData.price?.toString(),
          onChanged: (value) {
            if (value != null) {
              vm.updateData.price = double.tryParse(value);
            }
          },
        ),
        CustomButton(
          minWidth: double.infinity,
          title: product != null ? "Güncelle" : "Ekle",
          onPressed: () async {
            ProductModel? newData;
            if (product != null) {
              newData = await vm.update();
            } else {
              newData = await vm.save();
            }
            if (newData != null) {
              navigatorKey.currentState?.pop(newData);
            }
          },
        ),
      ],
    );
  }
}
