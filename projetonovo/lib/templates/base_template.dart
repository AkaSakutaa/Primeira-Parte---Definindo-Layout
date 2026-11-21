import 'package:flutter/material.dart';

class BaseTemplate extends StatelessWidget {
  final String titulo;
  final Widget body;
  final Widget? leading;
  final int? selectedIndex;
  final void Function(int)? onNavTap;

  const BaseTemplate({
    super.key,
    required this.titulo,
    required this.body,
    this.leading,
    this.selectedIndex,
    this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: leading,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
      // só mostra a barra de baixo se a página mandar o selectedIndex
      bottomNavigationBar: selectedIndex == null
          ? null
          : NavigationBar(
        selectedIndex: selectedIndex!,
        onDestinationSelected: onNavTap,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoritos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}