// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var usuEmail = TextEditingController();
  var usuSenha = TextEditingController();

  void InitState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FECAM SP'),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: campos(context),
          ),
        ],
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            //Ir para Sobre
            Navigator.pushNamed(
              context,
              'sobre',
            );
          },
          child: Text('Sobre'),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: Colors.blue.shade900),
            //minimumSize: Size(200, 50),
          ),
        ),
      ],
    );
  }

  campos(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            //Logotipo
            Image.asset('lib/images/logofecam.png', scale: 5),
            //TextField EMAIL
            TextField(
              controller: usuEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            //TextField Senha
            TextField(
              obscureText: true,
              controller: usuSenha,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            //Confirma Button
            ElevatedButton(
              onPressed: () {
                //Login
                LoginController().login(context, usuEmail.text, usuSenha.text);
              },
              //Conteudo
              child: Text('Entrar', style: TextStyle(fontSize: 24)),
              //ButtonStyle
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 8),
            //Cadastrar
            ElevatedButton(
              onPressed: () {
                //Ir para Cadastro
                Navigator.pushNamed(
                  context,
                  'cadastro',
                );
              },
              //Conteudo
              child: Text('Cadastrar', style: TextStyle(fontSize: 24)),
              //ButtonStyle
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 8),
            //Recuperar Senha
            ElevatedButton(
              onPressed: () {
                //Ir para recuperação de Senhas
                Navigator.pushNamed(
                  context,
                  'recuperar',
                );
              },
              child: Text('Recuperar Senha', style: TextStyle(fontSize: 22)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
