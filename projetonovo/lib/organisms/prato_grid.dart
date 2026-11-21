import 'package:flutter/material.dart';
import '../moleculas/prato_card.dart';

class PratoGrid extends StatelessWidget {
  final List<Map<String, String>> pratos;
  final void Function(Map<String, String> prato) onPratoTap;

  const PratoGrid({
    super.key,
    required this.pratos,
    required this.onPratoTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pratos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (_, i) {
        final prato = pratos[i];
        return PratoCard(
          emoji: prato['emoji']!,
          nome: prato['nome']!,
          desc: prato['desc']!,
          onTap: () => onPratoTap(prato),
        );
      },
    );
  }
}