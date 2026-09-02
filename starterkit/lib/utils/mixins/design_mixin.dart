import 'package:flutter/material.dart';

mixin DesignMixin {
  final edgePadding = 12.0;
  final bottomPadding = 56.0;

  BoxShadow get boxShadowDown => BoxShadow(
    color: Colors.black.withValues(alpha: .1),
    offset: const Offset(0, 2),
    blurRadius: 4,
  );
  BoxShadow get boxShadowCenter => BoxShadow(
    color: Colors.black.withValues(alpha: .1),
    offset: Offset.zero,
    blurRadius: 4,
  );
}
