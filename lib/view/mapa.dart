// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';
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

  // MapBoxAutoCompleteWidget buildSearchAutocomplete(BuildContext context) {
  //   return MapBoxAutoCompleteWidget(
  //     apiKey:
  //         "pk.eyJ1IjoicGVkcm9oZW5yaW03IiwiYSI6ImNsaXJ0Y3VzNzEwamszZW53ZTJkaDFoMWgifQ.GVNn71BmIfYqqPFiZA3cSw",
  //     hint: "Pesquisar Local",
  //     language: "pt",
  //     limit: 4,
  //     onSelect: (place) {
  //       try {
  //         if (place != null &&
  //             place.geometry != null &&
  //             place.geometry!.coordinates != null) {
  //           double newLat = place.geometry!.coordinates![1];
  //           double newLon = place.geometry!.coordinates![0];
  //           mapController
  //               .animateCamera(CameraUpdate.newLatLng(LatLng(newLat, newLon)));
  //         }
  //       } catch (e) {
  //         mensagem("Erro: $e");
  //       }
  //     },
  //   );
  // }

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
          // buildSearchAutocomplete(context),
          //Positioned(
          //  top: 20,
          //  left: 20,
          //  right: 20,
          //  child: buildSearchAutocomplete(context),
          //),
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
