import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/a.png',
              fit: BoxFit.cover,
            ),
            ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rec) {
                return LinearGradient(colors: []);
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
