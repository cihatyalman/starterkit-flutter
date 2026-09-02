import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../widgets/custom/custom_button.dart';

class CustomButtonDemo extends StatelessWidget {
  const CustomButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        CustomButton(onPressed: () {}, title: "Default"),
        CustomButton(
          minWidth: 120,
          elevation: 1,
          backgroundColor: navigatorKey.customColors.primary.shade100,
          textColor: navigatorKey.theme.primaryColor,
          onPressed: () {},
          title: "Elevated",
        ),
        CustomButton(
          minWidth: 120,
          backgroundColor: Colors.transparent,
          borderColor: navigatorKey.theme.primaryColor,
          textColor: navigatorKey.theme.primaryColor,
          onPressed: () {},
          title: "Outline",
        ),
        CustomButton(
          minWidth: 120,
          onPressed: () async {
            await Future.delayed(Duration(seconds: 1));
          },
          title: "Async",
        ),
        CustomButton(
          minWidth: 120,
          isEnabled: false,
          onPressed: () {},
          title: "Disabled",
        ),
        CustomButton(
          backgroundColor: Colors.transparent,
          textColor: navigatorKey.theme.primaryColor,
          onPressed: () {},
          title: "Text",
        ),
        CustomButton(
          minWidth: 1,
          padding: 8,
          onPressed: () {},
          titleWidget: Icon(Icons.ads_click_rounded, color: Colors.white),
        ),
      ],
    );
  }
}
