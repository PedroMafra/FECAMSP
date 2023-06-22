// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FECAM SP'),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //Foto
            Image.asset('lib/images/foto.jpeg', scale: 4),
            SizedBox(height: 5),
            Text('Pedro Henrique A. Mafra', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text('Cálculo de Frete FECAM SP', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('O aplicativo desenvolvido servirá para auxiliar os motoristas de caminhão autônomo no cálculo de seus fretes. Ele permite que os usuários selecionem facilmente as localizações de origem e destino de suas viagens, além de armazenar dados de fretes anteriores para serem reutilizados em futuras viagens.', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
            Text('Objetivos:', 
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
            Text('O objetivo principal do aplicativo é tornar o cálculo de frete mais fácil e ágil para os motoristas de caminhão autônomo. Com o aplicativo, os usuários poderão:', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
            Text('Selecionar as localizações de origem e destino de suas viagens em um mapa interativo, facilitando a identificação de rotas e distâncias percorridas;', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
            Text('Armazenar informações de fretes anteriores para serem reutilizados em futuras viagens, economizando tempo e evitando a necessidade de preencher as informações novamente;', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
            Text('Calcular o valor do frete com base nas informações fornecidas, como tipo de carga, peso, distância percorrida e tipo de veículo utilizado;', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),
            Text('Acompanhar o histórico de fretes realizados, permitindo que os usuários visualizem seus ganhos e despesas ao longo do tempo.', 
            style: TextStyle(fontSize: 16,), textAlign: TextAlign.justify,),  
          ],
        )
      ),
    );
  }
}
