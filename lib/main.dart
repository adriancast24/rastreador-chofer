import 'package:flutter/material.dart';
import 'chofer_menu.dart';
import 'radar_chofer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'radar chofer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const menu(),
    );
  }
}

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              OutlinedButton(
                  onPressed: () {
                    var push = Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('ir a menu chofer')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              OutlinedButton(
                  onPressed: () {
                    var push = Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Map()));
                  },
                  child: const Text('ir a mapa de localizacion')),
            ],
          )
        ],
      ),
    );
  }
}
