// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;




final myposition = LatLng(9.527260454515105, -69.24898527183468);

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                
              ),
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
      child: Icon(
        Icons.local_shipping,
        color: Colors.red,
        size: 30,
      ),
    );
  }
}
