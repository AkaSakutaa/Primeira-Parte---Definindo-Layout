import 'package:flutter/material.dart';
import '../templates/base_template.dart';
import '../organisms/prato_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final campoPesquisa = TextEditingController();

  String? erro;
  String? termo;

  final categorias = ['Todos', 'Lanches', 'Massas', 'Sobremesas', 'Saudável'];
  final List<Map<String, String>> pratos = [
    {'nome': 'X-Burger', 'desc': 'Pão, carne, queijo e salada', 'emoji': '🍔'},
    {'nome': 'Pizza', 'desc': 'Mussarela, tomate e manjericão', 'emoji': '🍕'},
    {'nome': 'Macarrão', 'desc': 'Molho sugo e parmesão', 'emoji': '🍝'},
    {'nome': 'Sorvete', 'desc': 'Três bolas com calda', 'emoji': '🍨'},
    {'nome': 'Salada', 'desc': 'Folhas, tomate e cenoura', 'emoji': '🥗'},
    {'nome': 'Sushi', 'desc': 'Combinado com 10 peças', 'emoji': '🍣'},
  ];

  void pesquisar() {
    String texto = campoPesquisa.text.trim().replaceAll(RegExp(r'\s+'), ' ');

    if (texto.isEmpty) {
      setState(() {
        erro = 'Digite o nome de uma receita antes de pesquisar.';
        termo = null;
      });
      return;
    }

    setState(() {
      erro = null;
      termo = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'ProjetinhoJM',
      leading: const Icon(Icons.restaurant_menu),
      selectedIndex: 0,
      onNavTap: (i) {
        const rotas = ['/', '/favoritos', '/perfil'];
        Navigator.pushReplacementNamed(context, rotas[i]);
      },
      body: Column(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: campoPesquisa,
                  onSubmitted: (_) => pesquisar(),
                  onChanged: (_) {
                    if (erro != null) {
                      setState(() {
                        erro = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome da receita',
                    hintText: 'Ex: bolo de cenoura',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    errorText: erro,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ElevatedButton(
                  onPressed: pesquisar,
                  child: const Text('Pesquisar'),
                ),
              ),
            ],
          ),
          if (termo != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Você pesquisou por: $termo',
                style: const TextStyle(fontSize: 15),
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
            child: PratoGrid(
              pratos: pratos,
              onPratoTap: (prato) {
                Navigator.pushNamed(context, '/detalhes', arguments: prato);
              },
            ),
          ),
        ],
      ),
    );
  }
}