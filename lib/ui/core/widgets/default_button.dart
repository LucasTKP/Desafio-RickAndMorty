import 'package:desafio_rickandmorty/ui/core/themes/extensions.dart';
import 'package:desafio_rickandmorty/ui/core/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = ThemeColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40, minWidth: double.infinity),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Text(label, style: context.textTheme.titleMedium?.copyWith(color: ThemeColors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
