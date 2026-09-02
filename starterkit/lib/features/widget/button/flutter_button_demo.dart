import 'package:flutter/material.dart';

import '../../../main.dart';

class FlutterButtonDemo extends StatelessWidget {
  const FlutterButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        MaterialButton(
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.padded,
          child: Text("Material"),
        ),
        FilledButton(onPressed: () {}, child: Text("Filled")),
        ElevatedButton(onPressed: () {}, child: Text("Elevated")),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: navigatorKey.theme.primaryColor),
            ),
          ),
          child: Text("Outline"),
        ),
        TextButton(onPressed: () {}, child: Text("Text")),
        IconButton.filled(
          onPressed: () {},
          icon: Icon(Icons.ads_click_rounded),
        ),
      ],
    );
  }
}
