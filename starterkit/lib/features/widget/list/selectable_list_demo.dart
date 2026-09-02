import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/helpers/widget_helper.dart';
import '../../../widgets/custom/selectable_list.dart';
import '../../../widgets/project/c_text.dart';
import 'mock_item_model.dart';

class SelectableListDemo extends StatelessWidget {
  SelectableListDemo({super.key});

  final items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText("SelectableList", isBold: true),
          CText(
            "Tekli veya çoklu şekilde seçilebilir itemlar oluşturur. Ek olarak liste, grid ve wrap olarak görüntülenebilir.",
            size: 12,
          ),
          hw.divider(),
          SelectableList(
            items: items,
            // mode: SelectableMode.multiple,
            viewMode: SelectableViewMode.wrap,
            radius: 100,
            callback: (newList) {
              debugPrint("[C_newList]: $newList");
            },
            itemWidget: (item, isSelected) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? navigatorKey.theme.primaryColor
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CText(
                  item,
                  isBold: isSelected,
                  color: isSelected ? navigatorKey.theme.primaryColor : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget itemWidget(MockItem item) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CText(item.title),
    );
  }
}
