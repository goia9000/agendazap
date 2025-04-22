import 'package:agendazap/politicaprivacidade.dart';
import 'package:agendazap/sobre.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 180,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff44ad3a),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icone-contato-whats.png',
                    width: 100,
                    height: 100,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Agenda Zap',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Versão 1.0.0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.green,
            ),
            title: const Text('Sobre nós'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Sobre(),
                ),
              );
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.policy,
                color: Colors.green,
              ),
              title: const Text('Política de privacidade'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Politicaprivacidade(),
                  ),
                );
              }),
          const ListTile(
            leading: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: Text('Excluir Todos os Dados'),
            onTap: () async {
              // Importa o pacote shared_preferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear(); // Limpa todos os dados armazenados

              // Exibe um diálogo de confirmação
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Dados Excluídos'),
                  content:
                      const Text('Todos os dados foram excluídos com sucesso.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Fecha o diálogo
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
