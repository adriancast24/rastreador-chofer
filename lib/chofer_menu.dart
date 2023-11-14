import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

var bucleLocation = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getcurrentlocation() async {
    bucleLocation = true;
    Position position = await determinePosition();
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      position;

      if (bucleLocation == false) {
        print('gps desactivado');
        timer.cancel();
      }
      print(position);
      print(position.timestamp);
      print(position.accuracy);

      String _response = '';

      const String url = 'http://127.0.0.1:5000/api/';
      final Map<String, String> headers = {'Content-Type': 'application/json'};
      final Map<String, dynamic> body = {
        'nombre': 1,
        'longitud': position.longitude,
        'latitud': position.latitude,
      };

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      setState(() {
        _response = 'Response: ${response.body}';
      });
    });

    //var positionvehicle = position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar Vehiculo'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              OutlinedButton(
                  onPressed: () {
                    getcurrentlocation();
                  },
                  child: const Text('activar localizador')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              OutlinedButton(
                  onPressed: () {
                    bucleLocation = false;
                  },
                  child: const Text('desactivar localizador')),
            ],
          )
        ],
      ),
    );
  }
}
