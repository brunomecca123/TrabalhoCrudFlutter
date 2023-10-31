import 'package:flutter/material.dart';
import 'package:trabalhocrud/components/user_tile.dart';
import 'package:trabalhocrud/provider/users.dart';
import 'package:trabalhocrud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.count,
              itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
              child: Text(
                'Adicionar Usuário',
                style: TextStyle(
                    fontWeight: FontWeight.bold), // Deixa o texto em negrito
              ),
            ),
          ),
        ],
      ),
    );
  }
}
