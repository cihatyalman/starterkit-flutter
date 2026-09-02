import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../widgets/custom/custom_animator.dart';
import '../../../../widgets/project/c_text.dart';

class CustomAnimatorDemo extends StatelessWidget {
  CustomAnimatorDemo({super.key});

  final color = navigatorKey.theme.primaryColor;

  @override
  Widget build(BuildContext context) {
    return CustomAnimator(
      duration: Duration(seconds: 1),
      tweenMap: {
        "opacity": Tween(begin: 0.0, end: 1.0),
        "rotate": Tween(begin: -(pi * .15), end: pi * .15),
        "scale": Tween(begin: 1.0, end: 1.5),
      },
      init: (animatorKey) {
        try {
          animatorKey.controller.repeat(reverse: true);
        } catch (e) {
          return;
        }
      },
      builder: (value, state) {
        final opacity = state.getValue("opacity");
        final rotate = state.getValue("rotate");
        final scale = state.getValue("scale");

        return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 8,
          children: [
            animatorItemWidget(
              CText(
                "Opacity",
                isBold: true,
                color: color.withValues(alpha: opacity),
              ),
            ),
            animatorItemWidget(
              Transform.rotate(
                angle: rotate,
                child: CText("Rotate", isBold: true, color: color),
              ),
            ),
            animatorItemWidget(
              Transform.scale(
                scale: scale,
                child: CText("Scale", isBold: true, color: color),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget animatorItemWidget(Widget child) {
    return Container(
      padding: EdgeInsets.all(4).copyWith(left: 8, right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
