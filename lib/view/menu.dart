// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, depend_on_referenced_packages, prefer_typing_uninitialized_variables, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_projetopedromafra/controller/calc_controller.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../controller/frete_controller.dart';
import '../model/fretes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/login_controller.dart';

const List<String> droplisteixo = <String>['2', '3', '4', '5', '6', '7', '9'];
const List<String> droplistfrete = <String>[
  'Lotação',
  'Somente Automotor',
  'Lotação - Alto Desempenho',
  'Somente Automotor - Alto Desempenho'
];
const List<String> droplistcarga = <String>[
  'Carga Geral',
  'Granel Sólido',
  'Granel Líquido',
  'Frigorificada',
  'Conteinerizada',
  'Neogranel',
  'Perigosa (Granel Sólido)',
  'Perigosa (Granel Líquido)',
  'Perigosa (Carga Frigorificada)',
  'Perigosa (Containerizada)',
  'Perigosa (Carga Geral)',
  'Carga Granel Pressurizada'
];

class MenuView extends StatefulWidget {
  MenuView({Key? key}) : super(key: key);
  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String dropdownValueEixo = droplisteixo.first;
  String dropdownValueFrete = droplistfrete.first;
  String dropdownValueCarga = droplistcarga.first;

  double ccd = 0.0;
  double cc = 0.0;
  List<double> values = [0.0, 0.0];

  double origLat = 0.0;
  double origLon = 0.0;
  double destLat = 0.0;
  double destLon = 0.0;

  bool box2 = false;

  var pageIndex = 0;
  var pageController = PageController(); //faz a troca

  var origem = TextEditingController();
  var destino = TextEditingController();
  var distancia = TextEditingController();
  var eixos = TextEditingController();
  var tipoFrete = TextEditingController();
  var tipoCarga = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Row(
          children: [
            Expanded(child: Text('FECAM SP')),
          ],
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      drawer: Builder(
        builder: (BuildContext context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                  ),
                  child: SizedBox(
                    height: kToolbarHeight,
                    child: Center(
                        child: Image.asset(
                      'lib/images/logofecam.png',
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
                FutureBuilder<String>(
                  future: LoginController().usuarioLogado(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListTile(
                        leading: Icon(Icons.account_circle, size: 26),
                        title: Text('Usuário: ${snapshot.data.toString()}',
                            style: TextStyle(fontSize: 20)),
                      );
                    }
                    return Text('');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, size: 26),
                  title: Text("Sair", style: TextStyle(fontSize: 20)),
                  onTap: () {
                    LoginController().logout();
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: PageView(
        controller: pageController,
        children: [
          Expanded(
            flex: 1,
            child: calculo(),
          ),
          Expanded(
            flex: 1,
            child: lista(),
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      //BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex, // quem está exibindo no momento
        backgroundColor: Colors.blue.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        items: [
          //Vetor com os items da NavBar
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calcular Frete'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Lista de Fretes'),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }

  calculo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Cálculo de Frete',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),

          //TextField Origem
          TextField(
            controller: origem,
            onTap: () {
              //Vai para o Mapa
              abremapa(destino);
            },
            decoration: InputDecoration(
              labelText: 'Origem',
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
              prefixIcon: IconButton(
                onPressed: () {
                  //Vai para o Mapa
                  abremapa(origem);
                },
                icon: Icon(Icons.map),
              ),
            ),
            onChanged: (value) {
              setState(() {
                getDistancia();
              });
            },
          ),
          SizedBox(height: 10),

          //TextField Destino
          TextField(
            controller: destino,
            onTap: () {
              //Vai para o Mapa
              abremapa(destino);
            },
            decoration: InputDecoration(
              labelText: 'Destino',
              labelStyle: TextStyle(fontSize: 20),
              prefixIcon: IconButton(
                onPressed: () {
                  //Vai para o Mapa
                  abremapa(destino);
                },
                icon: Icon(Icons.map),
              ),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                getDistancia();
              });
            },
          ),
          SizedBox(height: 10),

          Text('ou'),

          SizedBox(height: 10),
          //TextField Distancia
          TextField(
            controller: distancia,
            decoration: InputDecoration(
              labelText: 'Distância em km',
              labelStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Icons.route),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),

          //Dropdown Eixos
          Row(children: [
            Expanded(
              flex: 8,
              child: Text('Número de Eixos: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Flexible(
              flex: 2,
              child: DropdownButton<String>(
                style: TextStyle(fontSize: 18, color: Colors.black),
                iconSize: 40,
                value: dropdownValueEixo,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.blue.shade900,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueEixo = value!;
                  });
                },
                items:
                    droplisteixo.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ]),
          SizedBox(height: 10),

          Text('Tipo de Frete: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          //DropDown Frete
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: DropdownButton<String>(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  iconSize: 40,
                  value: dropdownValueFrete,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.blue.shade900,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValueFrete = value!;
                    });
                  },
                  items: droplistfrete
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          Text(
            'Tipo de Carga: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child:
                    //DropDown Carga
                    DropdownButton<String>(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  iconSize: 40,
                  value: dropdownValueCarga,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Colors.blue.shade900,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValueCarga = value!;
                    });
                  },
                  items: droplistcarga
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          //Ida e Volta
          Row(
            children: [
              //Retorno Vazio
              Checkbox(
                value: box2,
                onChanged: (bool? value) {
                  setState(() {
                    box2 = value!;
                  });
                },
                activeColor: Colors.blue.shade900,
                checkColor: Colors.white,
              ),
              Text('Retorno Vazio'),
            ],
          ),
          SizedBox(height: 10),

          //Confirma Button
          ElevatedButton(
            onPressed: () {
              CalculoController().setCCeCCD(context, dropdownValueFrete,
                  dropdownValueCarga, dropdownValueEixo, values);
              cc = values[0];
              ccd = values[1];
              if (cc != 0 && ccd != 0) {
                double dist = double.parse(distancia.text);
                if (box2 == true) {
                  double retornoVazio = (0.92 * dist * ccd);
                  double freteFinal = ((dist * ccd) + cc) + retornoVazio;
                  var f = Frete(
                      origem.text,
                      destino.text,
                      distancia.text,
                      dropdownValueFrete,
                      dropdownValueCarga,
                      dropdownValueEixo,
                      box2,
                      LoginController().idUsuario(),
                      freteFinal.toStringAsFixed(2));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Piso Minimo de Frete Cálculado: '),
                          content: SingleChildScrollView(
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Resultados\n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Distância: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${distancia.text} km\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Coeficiente de Custo de Deslocamento (CCD): ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "$ccd\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Coeficiente de Custo de Carga e Descarga (CC): ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "$cc\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Valor de Ida (Distância X CCD) + CC: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${(dist * ccd) + cc}\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Valor do Retorno Vazio (0.92 x Distancia x CCD): ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${retornoVazio.toStringAsFixed(2)}\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Valor do Piso Mínimo do Frete: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "R\$ ${freteFinal.toStringAsFixed(2)}\n",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          actions: [
                            TextButton(
                              onPressed: () {
                                FreteController().adicionar(context, f);
                                Navigator.of(context).pop();
                              },
                              child: Text('Salvar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Voltar'),
                            ),
                          ],
                        );
                      });
                } else {
                  double freteFinal = ((dist * ccd) + cc);
                  var f = Frete(
                      origem.text,
                      destino.text,
                      distancia.text,
                      dropdownValueFrete,
                      dropdownValueCarga,
                      dropdownValueEixo,
                      box2,
                      LoginController().idUsuario(),
                      freteFinal.toStringAsFixed(2));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Piso Minimo de Frete Cálculado: '),
                          content: SingleChildScrollView(
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Resultados\n",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Distância: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${distancia.text} km\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Coeficiente de Custo de Deslocamento (CCD): ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "$ccd\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Coeficiente de Custo de Carga e Descarga (CC): ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "$cc\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Valor de Ida (Distância X CCD) + CC: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${(dist * ccd) + cc}\n",
                                        ),
                                        TextSpan(
                                          text:
                                              "Valor do Piso Mínimo do Frete: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "R\$ ${freteFinal.toStringAsFixed(2)}\n",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          actions: [
                            TextButton(
                              onPressed: () {
                                FreteController().adicionar(context, f);
                                Navigator.of(context).pop();
                              },
                              child: Text('Salvar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Voltar'),
                            ),
                          ],
                        );
                      });
                }
              }
            },
            //Conteudo
            child: Text('Calcular', style: TextStyle(fontSize: 24)),
            //ButtonStyle
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              minimumSize: Size(200, 50),
            ),
          ),
        ],
      ),
    );
  }

  lista() {
    return StreamBuilder<QuerySnapshot>(
      stream: FreteController().listar().snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('Não foi possível conectar.'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            final dados = snapshot.requireData;
            if (dados.size > 0) {
              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index) {
                  String id = dados.docs[index].id;
                  dynamic item = dados.docs[index].data();
                  if (item['origem'] == null ||
                      item['origem'] == "" ||
                      item['destino'] == null ||
                      item['destino'] == "") {
                    double cust = double.parse(item['custo']);

                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Frete calculado com Distancia: '),
                        subtitle: Text(
                            'Distancia: ${item['distancia']} Km, Custo: R\$ ${cust.toStringAsFixed(2)}'),
                        onTap: () {
                          descricao(context, item);
                        },
                        onLongPress: () {
                          // Transferir para o formulário
                          distancia.text = item['distancia'];
                          eixos.text = item['eixos'];
                          origem.text = "";
                          destino.text = "";
                          atualizaDropdownEixo(item['eixos']);
                          atualizaDropdownFrete(item['frete']);
                          atualizaDropdownCarga(item['carga']);
                          if (item['retVazio'] == true) {
                            box2 = true;
                          } else {
                            box2 = false;
                          }
                          pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                          //Transferencia
                        },
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            FreteController().excluir(context, id);
                          },
                        ),
                      ),
                    );
                  } else {
                    double cust = double.parse(item['custo']);
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.map),
                        title: Text('${item['origem']} - ${item['destino']}'),
                        subtitle: Text(
                            'Distancia: ${item['distancia']} Km, Custo: R\$ ${cust.toStringAsFixed(2)}'),
                        onTap: () {
                          descricao(context, item);
                        },
                        onLongPress: () {
                          // Transferir para o formulário
                          distancia.text = item['distancia'];
                          eixos.text = item['eixos'];
                          origem.text = item['origem'];
                          destino.text = item['destino'];
                          dropdownValueEixo = item['eixos'];
                          dropdownValueCarga = item['carga'];
                          dropdownValueFrete = item['frete'];
                          if (item['retVazio'] == true) {
                            box2 = true;
                          } else {
                            box2 = false;
                          }

                          //Transferencia
                        },
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            FreteController().excluir(context, id);
                          },
                        ),
                      ),
                    );
                  }
                },
              );
            } else {
              return Center(
                child: Text('Nenhuma tarefa encontrada.'),
              );
            }
        }
      },
    );
  }

  void descricao(context, item) {
    String vvz;
    if (item['retVazio'] == true) {
      vvz = "Sim";
    } else {
      vvz = "Não";
    }
    double cust;
    cust = double.parse(item['custo']);
    if (item['origem'] == null ||
        item['origem'] == "" ||
        item['destino'] == null ||
        item['destino'] == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: Text("Detalhamento do Frete"),
            content: IntrinsicHeight(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "Frete Cálculado com distância\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Distância: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['distancia']} km\n",
                        ),
                        TextSpan(
                          text: "Custo: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "R\$ ${cust.toStringAsFixed(2)}\n",
                        ),
                        TextSpan(
                          text: "Nr. de Eixos: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['eixos']}\n",
                        ),
                        TextSpan(
                          text: "Tipo de Frete: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['frete']}\n",
                        ),
                        TextSpan(
                          text: "Tipo de Carga: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['carga']}\n",
                        ),
                        TextSpan(
                          text: "Retorno Vazio: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${vvz}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            actions: [
              TextButton(
                child: Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: Text("Detalhamento do Frete"),
            content: IntrinsicHeight(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "Origem: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['origem']}\n",
                        ),
                        TextSpan(
                          text: "Destino: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['destino']}\n\n",
                        ),
                        TextSpan(
                          text: "Distância: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['distancia']} km\n",
                        ),
                        TextSpan(
                          text: "Custo: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "R\$ ${cust.toStringAsFixed(2)}\n",
                        ),
                        TextSpan(
                          text: "Nr. de Eixos: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['eixos']}\n",
                        ),
                        TextSpan(
                          text: "Tipo de Frete: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['frete']}\n",
                        ),
                        TextSpan(
                          text: "Tipo de Carga: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${item['carga']}\n",
                        ),
                        TextSpan(
                          text: "Retorno Vazio: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${vvz}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            actions: [
              TextButton(
                child: Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void abremapa(controlador) async {
    final coord = await Navigator.pushNamed(context, 'mapa');
    if (coord != null && coord is LatLng) {
      String textCidade =
          await transformaCoord(coord.latitude, coord.longitude);
      if (controlador == origem) {
        origLat = coord.latitude;
        origLon = coord.longitude;
      } else {
        destLat = coord.latitude;
        destLon = coord.longitude;
      }
      setState(() {
        controlador.text = textCidade;
      });
      await getDistancia();
    } else {
      sucesso(context, "Erro ao adquirir coordenadas!");
    }
  }

  Future<String> transformaCoord(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String local =
            "${placemark.subAdministrativeArea}, ${placemark.administrativeArea} - ${placemark.country}";
        return local;
      }
    } catch (e) {
      sucesso(context, "Erro ao procurar endereço: $e");
    }
    return "$latitude, $longitude";
  }

  Future<void> getDistancia() async {
    if (origem.text.isNotEmpty && destino.text.isNotEmpty) {
      double distanciakm = await calcDistanciaCoord();
      if (distanciakm != null) {
        setState(() {
          distancia.text = distanciakm.toStringAsFixed(2);
        });
      }
    }
  }

  void atualizaDropdownEixo(String newValue) {
    setState(() {
      dropdownValueEixo = newValue;
    });
  }

  void atualizaDropdownFrete(String newValue) {
    setState(() {
      dropdownValueFrete = newValue;
    });
  }

  void atualizaDropdownCarga(String newValue) {
    setState(() {
      dropdownValueCarga = newValue;
    });
  }

  Future<double> calcDistanciaCoord() async {
    String apiKey =
        "SUACHAVEAPI";
    String apiUrl =
        "https://api.mapbox.com/directions/v5/mapbox/driving/$origLon,$origLat;$destLon,$destLat?access_token=$apiKey";

    var resposta = await http.get(Uri.parse(apiUrl));

    if (resposta.statusCode == 200) {
      var data = json.decode(resposta.body);
      double distancia = data['routes'][0]['distance'] / 1000;
      return distancia;
    } else {
      sucesso(context, "Erro ao calcular a distancia!");
      return 0.0;
    }
  }
}
