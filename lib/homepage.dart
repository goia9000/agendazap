import 'package:flutter/material.dart';
import 'package:agendazap/menu_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, String>> contacts = [
    {'name': 'Contato 1', 'phone': '123456789'},
    {'name': 'Contato 2', 'phone': '987654321'},
  ];

  void _addContact(String name, String phone) {
    setState(() {
      contacts.add(
        {'name': name, 'phone': phone},
      );
    });
  }

  void _showAddContactDialog() {
    String name = '';
    String phone = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Adicionar Contato',
            style: TextStyle(color: Colors.green),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Nome',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Telefone',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
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
              onPressed: () {
                if (name.isNotEmpty && phone.isNotEmpty) {
                  _addContact(name, phone);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Adicionar',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditContactDialog(int index) {
    String name = contacts[index]['name'] ?? '';
    String phone = contacts[index]['phone'] ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Editar Contato',
            style: TextStyle(color: Colors.green),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                controller: TextEditingController(text: name),
              ),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                controller: TextEditingController(text: phone),
              ),
            ],
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
              onPressed: () {
                if (name.isNotEmpty && phone.isNotEmpty) {
                  setState(() {
                    contacts[index] = {'name': name, 'phone': phone};
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos WhatsApp'),
        centerTitle: true,
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[500]!,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Colors.green,
                      size: 35,
                    ),
                    hintText: 'Pesquisar...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    width: 40,
                    height: 40,
                    'assets/whatsapp.png',
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contacts[index]['name'] ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.5),
                      ),
                      Text(contacts[index]['phone'] ?? ''),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showEditContactDialog(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Excluir Contato',
                                  style: TextStyle(color: Colors.green),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Deseja excluir esse contato?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text('Nome: ${contacts[index]['name']}'),
                                    Text(
                                        'Telefone: ${contacts[index]['phone']}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Excluir',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        contacts.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddContactDialog,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
