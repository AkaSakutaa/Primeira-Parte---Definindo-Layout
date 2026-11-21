import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detalhes_page.dart';
import 'pages/favoritos_page.dart';
import 'pages/perfil_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProjetinhoJM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/detalhes': (_) => const DetalhesPage(),
        '/favoritos': (_) => const FavoritosPage(),
        '/perfil': (_) => const PerfilPage(),
      },
    );
  }
}