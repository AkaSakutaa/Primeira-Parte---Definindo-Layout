import 'package:flutter/material.dart';
import '../templates/base_template.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'Favoritos',
      selectedIndex: 1,
      onNavTap: (i) {
        const rotas = ['/', '/favoritos', '/perfil'];
        Navigator.pushReplacementNamed(context, rotas[i]);
      },
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 80, color: Colors.deepOrange),
            SizedBox(height: 16),
            Text(
              'Você ainda não tem pratos favoritos',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}