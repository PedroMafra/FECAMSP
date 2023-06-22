// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  var usuEmail = TextEditingController();
  var usuSenha = TextEditingController();
  var usuNome = TextEditingController();
  var usuTelefone = TextEditingController();

  void InitState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('FECAMSP'),
          backgroundColor: Colors.blue.shade900,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: formulario(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                
                ),
              )
          ],
        )
    );
  }

  formulario(){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //Titulo
            Text('Formulário de Cadastro', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
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
            SizedBox(height: 10),

            //TextField NOME
            TextField(
              controller: usuNome,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.person),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            //TextField Senha
            TextField(
              obscureText: false,
              controller: usuSenha,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.lock),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),

            //Cadastrar
            ElevatedButton(
              onPressed: () {
                //Cadastrar Usuário
                LoginController().criarConta(context, usuNome.text, usuEmail.text, usuSenha.text);
              },
              //ButtonStyle
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                minimumSize: Size(200, 50),
              ),
              //Conteudo
              child: Text('Cadastrar', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}