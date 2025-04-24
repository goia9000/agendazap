import 'package:agendazap/politicaprivacidade.dart';
import 'package:agendazap/sobre.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  void _confirmDeleteAllData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Excluir Todos os Dados',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text(
            'Tem certeza de que deseja excluir todos os dados? Esta ação não pode ser desfeita.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                if (context.mounted) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Dados Excluídos'),
                      content: const Text(
                        'Todos os dados foram excluídos com sucesso.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/',
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'Excluir',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

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
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: const Text('Excluir Todos os Dados'),
            onTap: () {
              _confirmDeleteAllData(context);
            },
          ),
        ],
      ),
    );
  }
}
