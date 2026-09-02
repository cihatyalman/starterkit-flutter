import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/project/c_text.dart';
import 'counter_store.dart';

class CounterDemo extends StatelessWidget {
  CounterDemo({super.key});

  final store = CounterStore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        CText("Store", isBold: true, size: 24),
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
      child: store.listen(
        (data, _) => CText(data.toString(), isBold: true, size: 40),
      ),
    );
  }

  Widget decrementButton() {
    return GestureDetector(
      onTap: () => store.decrement(),
      onLongPressStart: (details) => store.decrementLong(true),
      onLongPressEnd: (details) => store.decrementLong(false),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navigatorKey.theme.primaryColor,
        ),
        child: Icon(Icons.remove, color: Colors.white),
      ),
    );
  }

  Widget incrementButton() {
    return GestureDetector(
      onTap: () => store.increment(),
      onLongPressStart: (details) => store.incrementLong(true),
      onLongPressEnd: (details) => store.incrementLong(false),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navigatorKey.theme.primaryColor,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget resetButton() {
    return GestureDetector(
      onTap: () => store.reset(),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navigatorKey.theme.primaryColor,
        ),
        child: Icon(Icons.restart_alt_rounded, color: Colors.white),
      ),
    );
  }
}
