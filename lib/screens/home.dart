import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  double? heading = 0;
  @override
  void initState() {
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading!;
      });
    });
    super.initState();
  }

  // done
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Compass App',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${heading!.ceil()}°",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/cadrant.png'),
                Transform.rotate(
                  angle: ((heading ?? 0) * (pi / 180) * -1),
                  child: Image.asset(
                    'assets/images/compass.png',
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
