import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../widgets/custom/custom_dropdown.dart';
import '../../../widgets/custom/dropdown_bs.dart';
import '../../../widgets/project/c_text.dart';

class DropdownDemo extends StatelessWidget {
  const DropdownDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget("Dropdown"),
        dropdownWidget(),
        spaceWidget,
        titleWidget("Dropdown BottomSheet"),
        dropdownBSWidget(),
      ],
    );
  }

  Widget get spaceWidget => SizedBox(height: 8);

  Widget titleWidget(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 2),
    child: CText(title, isBold: true, size: 14),
  );

  Widget dropdownWidget() {
    final items = List.generate(
      40,
      (index) => {"id": "Id${index + 1}", "title": "Item ${index + 1}"},
    );

    final selectedNotifier = ValueNotifier(-1);

    return ValueListenableBuilder(
      valueListenable: selectedNotifier,
      builder: (_, value, _) {
        return CustomDropdown(
          hintText: "Item Seç",
          items: items,
          itemWidget: (item) =>
              DropdownMenuEntry(value: item, label: item["title"] ?? ""),
          onChanged: (item) {
            debugPrint("[C_i]: $item");
            if (item == null) {
              selectedNotifier.value = -1;
              return;
            }
            final key = item["id"];
            if (key != null) {
              selectedNotifier.value = items.indexWhere((e) => e["id"] == key);
            }
          },
        );
      },
    );
  }

  Widget dropdownBSWidget() {
    final items = List.generate(
      10,
      (index) => {"id": "Id${index + 1}", "title": "Item ${index + 1}"},
    );

    final mapItems = {for (var e in items) e["id"]!: e["title"] as dynamic};

    return DropdownBS(
      dataList: mapItems,
      title: "Item Seç",
      bsSelectedColor: navigatorKey.theme.primaryColor,
      deleteButtonEnabled: true,
      searchInputEnabled: true,
      searchInputHintText: "Ara..",
      callback: (value) => debugPrint("[C_value]: $value"),
    );
  }
}
