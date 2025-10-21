import 'package:desafio_rickandmorty/ui/core/themes/extensions.dart';
import 'package:flutter/material.dart';

class CompleteLoadingCard extends StatelessWidget {
  const CompleteLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Não há mais personagens para carregar.',
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
