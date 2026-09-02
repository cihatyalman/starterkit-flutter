import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/project/c_appbar.dart';

class ColorScreen extends StatelessWidget {
  static const route = 'ColorScreen';

  ColorScreen({super.key});

  late ThemeData theme;
  late ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    theme = Theme.of(context);

    return Scaffold(
      appBar: CAppBar(title: "Renkler").build(context),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          paletWidget("**BLACK**", [
            Colors.black12,
            Colors.black26,
            Colors.black38,
            Colors.black45,
            Colors.black54,
            Colors.black87,
            Colors.black,
          ]),
          paletWidget("**PRIMARY(700)**", [
            context.customColors?.primary.shade50,
            context.customColors?.primary.shade100,
            context.customColors?.primary.shade200,
            context.customColors?.primary.shade300,
            context.customColors?.primary.shade400,
            context.customColors?.primary.shade500,
            context.customColors?.primary.shade600,
            context.customColors?.primary,
            context.customColors?.primary.shade800,
            context.customColors?.primary.shade900,
          ]),
          paletWidget("**GREY**", [
            Colors.grey.shade50,
            Colors.grey.shade100,
            Colors.grey.shade200,
            Colors.grey.shade300, // Colors.black12,
            Colors.grey.shade400, // Colors.black26,
            Colors.grey, // Colors.black38,
            Colors.grey.shade600, // Colors.black54,
            Colors.grey.shade700,
            Colors.grey.shade800,
            Colors.grey.shade900, // Colors.black87,
          ]),
          paletWidget("**SURFACE**", [
            colorScheme.surfaceContainerLowest,
            colorScheme.surface,
            colorScheme.surfaceContainerLow,
            colorScheme.surfaceContainer,
            colorScheme.surfaceContainerHigh,
            colorScheme.surfaceContainerHighest,
            colorScheme.onSurfaceVariant,
            colorScheme.inverseSurface,
            colorScheme.onSurface,
            Colors.black,
          ]),
          divider,
          // #region Primary
          color2Item(
            colorScheme.primary,
            colorScheme.onPrimary,
            "*PRIMARY",
            "*onPrimary",
          ),
          color2Item(
            colorScheme.primaryContainer,
            colorScheme.onPrimaryContainer,
            "*primaryContainer",
            "*onPrimaryContainer",
          ),
          color2Item(
            colorScheme.primaryFixed,
            colorScheme.onPrimaryFixed,
            "primaryFixed",
            "onPrimaryFixed",
          ),
          color2Item(
            colorScheme.primaryFixedDim,
            colorScheme.onPrimaryFixedVariant,
            "primaryFixedDim",
            "onPrimaryFixedVariant",
          ),
          color2Item(
            colorScheme.inversePrimary,
            colorScheme.onPrimary,
            "inversePrimary",
            "onPrimary",
          ),
          // #endregion
          divider,
          // #region Surface
          color2Item(
            colorScheme.surface,
            colorScheme.onSurface,
            "*SURFACE",
            "*onSurface",
          ),
          color2Item(
            colorScheme.surfaceBright,
            colorScheme.surfaceTint,
            "surfaceBright",
            "surfaceTint",
          ),
          paletWidget("*surfaceContainer", [
            colorScheme.surfaceContainerLowest,
            colorScheme.surfaceContainerLow,
            colorScheme.surfaceContainer,
            colorScheme.surfaceContainerHigh,
            colorScheme.surfaceContainerHighest,
          ]),
          color2Item(
            colorScheme.inverseSurface,
            colorScheme.onInverseSurface,
            "inverseSurface",
            "onInverseSurface",
          ),
          color2Item(
            colorScheme.surfaceDim,
            colorScheme.onSurfaceVariant,
            "surfaceDim",
            "onSurfaceVariant",
          ),
          // #endregion
          divider,
          color2Item(
            colorScheme.outline,
            colorScheme.outlineVariant,
            "OUTLINE",
            "outlineVariant",
          ),
          divider,
          // #region Secondary
          color2Item(
            colorScheme.secondary,
            colorScheme.onSecondary,
            "SECONDARY",
            "onSecondary",
          ),
          color2Item(
            colorScheme.secondaryContainer,
            colorScheme.onSecondaryContainer,
            "secondaryContainer",
            "onSecondaryContainer",
          ),
          color2Item(
            colorScheme.secondaryFixed,
            colorScheme.onSecondaryFixed,
            "secondaryFixed",
            "onSecondaryFixed",
          ),
          color2Item(
            colorScheme.secondaryFixedDim,
            colorScheme.onSecondaryFixedVariant,
            "secondaryFixedDim",
            "onSecondaryFixedVariant",
          ),
          // #endregion
          divider,
          // #region Tertiary
          color2Item(
            colorScheme.tertiary,
            colorScheme.onTertiary,
            "TERTIARY",
            "onTertiary",
          ),
          color2Item(
            colorScheme.tertiaryContainer,
            colorScheme.onTertiaryContainer,
            "tertiaryContainer",
            "onTertiaryContainer",
          ),
          color2Item(
            colorScheme.tertiaryFixed,
            colorScheme.onTertiaryFixed,
            "tertiaryFixed",
            "onTertiaryFixed",
          ),
          color2Item(
            colorScheme.tertiaryFixedDim,
            colorScheme.onTertiaryFixedVariant,
            "tertiaryFixedDim",
            "onTertiaryFixedVariant",
          ),
          // #endregion
        ],
      ),
    );
  }

  Widget get divider => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Divider(),
  );

  Widget colorItem(Color color, String title) {
    return Container(
      width: double.infinity,
      height: 40,
      color: color,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          backgroundColor: colorScheme.surface,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget color2Item(Color color, Color onColor, String title, String onTitle) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 40,
            color: color,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                backgroundColor: colorScheme.surface,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 40,
            color: onColor,
            alignment: Alignment.centerRight,
            child: Text(
              onTitle,
              style: TextStyle(
                backgroundColor: colorScheme.surface,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget paletWidget(String title, List<Color?> colorList) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: colorList.map((e) => colorWidget(e ?? Colors.red)).toList(),
        ),
        Text(
          title,
          style: TextStyle(
            backgroundColor: colorScheme.surface,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget colorWidget(Color color) {
    return Expanded(
      child: Container(width: double.infinity, height: 40, color: color),
    );
  }
}
