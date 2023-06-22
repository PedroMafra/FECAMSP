import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/fretes.dart';
import '../view/util.dart';
import 'login_controller.dart';

class FreteController {
  void adicionar(context, Frete f) {
    FirebaseFirestore.instance
        .collection('fretes')
        .add(f.toJson())
        .then((value) => sucesso(context, 'Frete adicionado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void atualizar(context, id, Frete f) {
    FirebaseFirestore.instance
        .collection('fretes')
        .doc(id)
        .update(f.toJson())
        .then((value) => sucesso(context, 'Frete atualizado com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.of(context).pop());
  }

  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('fretes')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Frete excluído com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'));
  }

  listar() {
    return FirebaseFirestore.instance
        .collection('fretes')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}
