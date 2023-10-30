import 'package:flutter/material.dart';
import 'package:trabalhocrud/models/user.dart';
import 'package:trabalhocrud/provider/users.dart';
import 'package:trabalhocrud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.email),
          Text(user.telefone), // Exibindo o telefone
        ],
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.app_registration_rounded),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<UsersProvider>(context, listen: false).remove(user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
