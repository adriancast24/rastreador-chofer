// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const MyApp());

const MAPBOX_STYLE = 'mapbox/satellite-streets-v12';
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiYWRyaWFuMjQxMSIsImEiOiJjbG9vcGQ2cDkwMjVtMmlucXgyaGU3eng5In0.ORQLH2W-crQxenubWZTRKQ';

final myposition = LatLng(9.527154, -69.247328);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Mapa'),
          backgroundColor: Colors.indigo,
        ),
        body: Stack(children: [
          FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: myposition,
              initialZoom: 17,
              minZoom: 15,
              maxZoom: 25,
              initialRotation: 30,
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': MAPBOX_STYLE,
                  }),
              MarkerLayer(
                markers: [
                  Marker(
                    point: myposition,
                    child: const myLocationMaker(),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class myLocationMaker extends StatelessWidget {
  const myLocationMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
      ),
    );
  }
}
