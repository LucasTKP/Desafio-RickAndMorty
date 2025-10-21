import 'package:desafio_rickandmorty/ui/core/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';

class LoadingCard extends StatefulWidget {
  final VoidCallback loadMore;
  const LoadingCard({super.key, required this.loadMore});

  @override
  State<LoadingCard> createState() => _LoadingCardState();
}

class _LoadingCardState extends State<LoadingCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: CustomCircularProgress()),
    );
  }
}
