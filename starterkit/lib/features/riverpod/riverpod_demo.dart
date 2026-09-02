import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../widgets/project/c_text.dart';
import 'counter_controller.dart';

class RiverpodDemo extends StatelessWidget {
  const RiverpodDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        CText("Riverpod", isBold: true, size: 24),
        textWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [decrementButton(), resetButton(), incrementButton()],
        ),
      ],
    );
  }

  Widget textWidget() {
    return Container(
      alignment: Alignment.center,
      width: 56,
      child: Consumer(
        builder: (context, ref, child) {
          final count = ref.watch(counterProvider);
          return CText(count.toString(), isBold: true, size: 40);
        },
      ),
    );
  }

  Widget decrementButton() {
    return Consumer(
      builder: (context, ref, child) {
        final ctrl = ref.read(counterProvider.notifier);
        return GestureDetector(
          onTap: () => ctrl.decrement(),
          onLongPressStart: (details) => ctrl.decrementLong(true),
          onLongPressEnd: (details) => ctrl.decrementLong(false),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navigatorKey.theme.primaryColor,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        );
      },
    );
  }

  Widget incrementButton() {
    return Consumer(
      builder: (context, ref, child) {
        final ctrl = ref.read(counterProvider.notifier);
        return GestureDetector(
          onTap: () => ctrl.increment(),
          onLongPressStart: (details) => ctrl.incrementLong(true),
          onLongPressEnd: (details) => ctrl.incrementLong(false),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navigatorKey.theme.primaryColor,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }

  Widget resetButton() {
    return Consumer(
      builder: (context, ref, child) {
        return GestureDetector(
          onTap: () => ref.invalidate(counterProvider),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navigatorKey.theme.primaryColor,
            ),
            child: Icon(Icons.restart_alt_rounded, color: Colors.white),
          ),
        );
      },
    );
  }
}
