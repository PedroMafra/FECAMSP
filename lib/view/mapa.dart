// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:geolocator/geolocator.dart';
import 'util.dart';

class MapaView extends StatefulWidget {
  const MapaView({Key? key}) : super(key: key);

  @override
  State<MapaView> createState() => _MapaViewState();
}

class _MapaViewState extends State<MapaView> {
  double lat = 0.0, lon = 0.0;
  late MapboxMapController mapController;

  mapaCriado(MapboxMapController controller) {
    mapController = controller;
  }

  selecionarCoordenada(Point<double> ponto, LatLng coordenadas) {
    Navigator.pop(context, coordenadas);
  }

  // _styleCarregado() {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text("Style Carregado"),
  //     backgroundColor: Theme.of(context).primaryColor,
  //     duration: Duration(seconds: 1),
  //   ));
  // }

  @override
  void initState() {
    super.initState();
    latilongi();
  }

  Widget buildMapa(BuildContext context) {
    if (lat != 0 && lon != 0) {
      return MapboxMap(
        accessToken:
            "pk.eyJ1IjoicGVkcm9oZW5yaW03IiwiYSI6ImNsaXJ0Y3VzNzEwamszZW53ZTJkaDFoMWgifQ.GVNn71BmIfYqqPFiZA3cSw",
        styleString: MapboxStyles.MAPBOX_STREETS,
        onMapCreated: mapaCriado,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lon),
          zoom: 10.0,
        ),
        onMapClick: selecionarCoordenada,
        //onStyleLoadedCallback: _styleCarregado,
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FECAM SP'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          buildMapa(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          centralizar();
        },
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }

  void centralizar() async {
    if (mapController != null) {
      latilongi();
      await mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(lat, lon)),
      );
    }
  }

  latilongi() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double longitude = position.longitude;
      double latitude = position.latitude;
      setState(() {
        lat = latitude;
        lon = longitude;
      });
    } catch (e) {
      setState(() {
        lat = -23.5489;
        lon = -46.6388;
      });
      sucesso(context, 'Erro ao obter Longitude e Latitude: $e');
    }
  }
}
