import 'package:flutter/material.dart';
import '../templates/base_template.dart';
import '../atoms/app_button.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // pega o prato que veio da tela de início
    final prato =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return BaseTemplate(
      titulo: prato['nome']!,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Text(prato['emoji']!, style: const TextStyle(fontSize: 100)),
          const SizedBox(height: 16),
          Text(
            prato['nome']!,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            prato['desc']!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          AppButton(
            texto: 'Voltar',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}