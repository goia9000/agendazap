import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/icone-contato-whats.png',
                  width: 100,
                  height: 100,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WhatsApp',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff44ad3a),
                      ),
                    ),
                    Text(
                      'Lista de contatos',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff44ad3a),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
              'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
              'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
              'mollit anim id est laborum.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Desenvolvido por',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff010101),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Bruno Goia',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff010101),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contato',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff030303),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'bruno@teste.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff030303),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Versão',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff010101),
                  ),
                ),
                Text(' 1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff010101),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
