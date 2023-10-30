import 'package:flutter/material.dart';
import 'package:trabalhocrud/models/user.dart';
import 'package:trabalhocrud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['telefone'] = user.telefone; // Adicionado campo de telefone
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;

    if (user != null) {
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (newValue) => _formData['name'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (newValue) => _formData['email'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['telefone'],
                decoration: const InputDecoration(labelText: 'Telefone'),
                onSaved: (newValue) => _formData['telefone'] = newValue!,
              ),
              ElevatedButton(
                onPressed: () {
                  _form.currentState?.save();

                  String id = _formData['id'] ?? '';
                  String name = _formData['name'] ?? '';
                  String email = _formData['email'] ?? '';
                  String telefone = _formData['telefone'] ?? '';

                  Provider.of<UsersProvider>(context, listen: false).put(
                    User(
                      id: id,
                      name: name,
                      email: email,
                      telefone: telefone,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
