import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/helpers/function_helper.dart';
import '../../../utils/helpers/widget_helper.dart';
import '../../../widgets/project/c_text.dart';
import '../models/product_model.dart';

class BuyButton extends StatelessWidget {
  final ProductModel product;
  const BuyButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("[C_product]: ${product.title}");
      },
      child: Container(
        padding: EdgeInsets.all(16).copyWith(bottom: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              offset: const Offset(0, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [hw.boxShadowCenter],
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                  ),
                  child: CText(
                    "Satın Al",
                    isBold: true,
                    size: 18,
                    color: navigatorKey.theme.primaryColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: navigatorKey.theme.primaryColor,
                  boxShadow: [hw.boxShadowCenter],
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(12),
                  ),
                ),
                child: CText(
                  "${hf.toStringDouble(product.price)}₺",
                  isBold: true,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
