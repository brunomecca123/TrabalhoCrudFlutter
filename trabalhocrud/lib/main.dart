import 'package:flutter/material.dart';
import 'package:trabalhocrud/routes/app_routes.dart';
import 'package:trabalhocrud/views/user-form.dart';
import 'package:trabalhocrud/views/user_list.dart';
import 'package:trabalhocrud/provider/users.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        )
      ],
      child: MaterialApp(
        title: 'TRABALHO CRUD',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                Colors.lightGreen, // Altere a cor conforme necessário
          ),
          scaffoldBackgroundColor:
              Colors.lightGreen, // Define o fundo cinza chumbo
          // Outras definições de tema
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
