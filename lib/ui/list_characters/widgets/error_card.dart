import 'package:desafio_rickandmorty/ui/core/themes/extensions.dart';
import 'package:desafio_rickandmorty/ui/core/widgets/default_button.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatefulWidget {
  final VoidCallback tryAgain;
  final String error;
  const ErrorCard({super.key, required this.tryAgain, required this.error});

  @override
  State<ErrorCard> createState() => _ErrorCardState();
}

class _ErrorCardState extends State<ErrorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.error,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
          ),
          SizedBox(height: 8),
          DefaultButton(
            onPressed: widget.tryAgain,
            label: "Tentar novamente",
            color: Colors.red[700],
          ),
        ],
      ),
    );
  }
}
