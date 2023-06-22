// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class RecuperarView extends StatefulWidget {
  const RecuperarView({super.key});

  @override
  State<RecuperarView> createState() => _RecuperarViewState();
}

class _RecuperarViewState extends State<RecuperarView> {
  var usuEmail = TextEditingController();

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
              child: formulario(),
            )
          ],
        ));
  }

  formulario() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Recuperação de Senha:',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            //TextField EMAIL
            TextField(
              controller: usuEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.email),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),

            //Recuperar Senha
            ElevatedButton(
              onPressed: () {
                //Recupera Senha
                LoginController().esqueceuSenha(context, usuEmail.text);
              },
              //ButtonStyle
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(200, 50),
              ),
              //Conteudo
              child: Text('Enviar Email', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
