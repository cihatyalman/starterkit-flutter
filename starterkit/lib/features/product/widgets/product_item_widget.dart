import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../screens/product/product_details_screen.dart';
import '../../../utils/helpers/function_helper.dart';
import '../../../widgets/custom/cached_image.dart';
import '../../../widgets/project/c_text.dart';
import '../models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel data;
  const ProductItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigatorKey.currentState?.pushNamed(
        ProductDetailsScreen.route,
        arguments: data.id,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 100,
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedImage(imageData: data.imageUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CText(data.title, isBold: true),
                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Expanded(
                        child: CText(
                          data.description,
                          maxLines: 2,
                          color: Colors.grey,
                        ),
                      ),
                      CText(
                        "${hf.toStringDouble(data.price)} ₺",
                        isBold: true,
                        textAlign: TextAlign.end,
                        size: 16,
                        color: navigatorKey.theme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
