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
          const ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.green,
            ),
            title: Text('Sobre nós'),
          ),
          const ListTile(
            leading: Icon(
              Icons.policy,
              color: Colors.green,
            ),
            title: Text('Política de privacidade'),
          ),
          const ListTile(
            leading: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: Text('Excluir Todos os Dados'),
          ),
        ],
      ),
    );
  }
}
