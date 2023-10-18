import 'package:flutter/material.dart';

class JPBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const JPBackButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
