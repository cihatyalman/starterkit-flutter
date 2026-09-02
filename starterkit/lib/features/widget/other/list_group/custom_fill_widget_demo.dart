import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../widgets/custom/custom_button.dart';
import '../../../../widgets/custom/custom_fill_widget.dart';

class CustomFillWidgetDemo extends StatelessWidget {
  CustomFillWidgetDemo({super.key});

  final valueNotifier = ValueNotifier(0.0);

  late Color color;

  @override
  Widget build(BuildContext context) {
    color = navigatorKey.customColors.primary.shade200;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        CustomButton(
          minWidth: 1,
          onPressed: () async {
            if (valueNotifier.value >= .1) valueNotifier.value -= .1;
          },
          title: "-1",
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ValueListenableBuilder<double>(
            valueListenable: valueNotifier,
            builder: (_, value, _) {
              return CustomFillWidget(
                radius: 100,
                height: 40,
                width: 200,
                value: value,
                backgroundColor: Colors.transparent,
                forgroundColor: color,
                child: SizedBox.shrink(),
              );
            },
          ),
        ),

        CustomButton(
          minWidth: 1,
          onPressed: () async {
            if (valueNotifier.value <= .9) valueNotifier.value += .1;
          },
          title: "+1",
        ),
      ],
    );
  }
}
