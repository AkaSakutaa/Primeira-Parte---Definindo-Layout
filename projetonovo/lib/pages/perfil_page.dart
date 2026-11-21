import 'package:flutter/material.dart';
import '../templates/base_template.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'Perfil',
      selectedIndex: 2,
      onNavTap: (i) {
        const rotas = ['/', '/favoritos', '/perfil'];
        Navigator.pushReplacementNamed(context, rotas[i]);
      },
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Seu nome aqui',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}