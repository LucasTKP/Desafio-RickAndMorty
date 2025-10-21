import 'dart:math' as math;

import 'package:desafio_rickandmorty/ui/core/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  final Color color;

  const CustomCircularProgress({
    super.key,
    this.color = ThemeColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final sizeCircular = math.min(width * 0.1, 120).toDouble();
    final strokeCircular = sizeCircular * 0.1;

    return SizedBox(
      width: sizeCircular,
      child: AspectRatio(
        aspectRatio: 1,
        child: CircularProgressIndicator(color: color, strokeWidth: strokeCircular),
      ),
    );
  }
}
