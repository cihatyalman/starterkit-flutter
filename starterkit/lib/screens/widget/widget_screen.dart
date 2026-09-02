import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/helpers/widget_helper.dart';
import '../../widgets/project/c_appbar.dart';
import '../../widgets/project/c_text.dart';
import 'image_widget_screen.dart';
import 'input_widget_screen.dart';
import 'list_widget_screen.dart';
import 'other_widget_screen.dart';
import 'button_widget_screen.dart';

class WidgetScreen extends StatelessWidget {
  static const route = 'WidgetScreen';

  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(title: "Widgetlar").build(context),
      body: GridView(
        padding: EdgeInsets.all(hw.edgePadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        children: [
          buttonWidget("Buton", ButtonWidgetScreen.route),
          buttonWidget("Input", InputWidgetScreen.route),
          buttonWidget("Image", ImageWidgetScreen.route),
          buttonWidget("Liste", ListWidgetScreen.route),
          buttonWidget("Diğer Widgetlar", OtherWidgetScreen.route),
        ],
      ),
    );
  }

  Widget buttonWidget(String title, String screenName) {
    return InkWell(
      onTap: () async => navigatorKey.currentState?.pushNamed(screenName),
      borderRadius: BorderRadius.circular(12),
      splashColor: navigatorKey.customColors.primary.shade300,
      child: Ink(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: navigatorKey.customColors.primary.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-1, 2),
              blurRadius: 2,
              spreadRadius: .5,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: CText(title, isBold: true, size: 16),
        ),
      ),
    );
  }
}
