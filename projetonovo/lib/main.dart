import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = ['Todos', 'Lanches', 'Massas', 'Sobremesas', 'Saudável'];
    final pratos = [
      {'nome': 'X-Burger', 'desc': 'Pão, carne, queijo e salada', 'emoji': '🍔'},
      {'nome': 'Pizza', 'desc': 'Mussarela, tomate e manjericão', 'emoji': '🍕'},
      {'nome': 'Macarrão', 'desc': 'Molho sugo e parmesão', 'emoji': '🍝'},
      {'nome': 'Sorvete', 'desc': 'Três bolas com calda', 'emoji': '🍨'},
      {'nome': 'Salada', 'desc': 'Folhas, tomate e cenoura', 'emoji': '🥗'},
      {'nome': 'Sushi', 'desc': 'Combinado com 10 peças', 'emoji': '🍣'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjetinhoJM'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.restaurant_menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Bateu a fome?\nEncontre seu prato favorito 😋',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar comida...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) => ChoiceChip(
                  label: Text(categorias[i]),
                  selected: i == 0,
                  onSelected: (_) {},
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pratos populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: pratos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (_, i) => Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pratos[i]['emoji']!,
                            style: const TextStyle(fontSize: 44)),
                        const SizedBox(height: 8),
                        Text(
                          pratos[i]['nome']!,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pratos[i]['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoritos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}