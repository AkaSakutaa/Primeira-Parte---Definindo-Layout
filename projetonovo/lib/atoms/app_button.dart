import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}