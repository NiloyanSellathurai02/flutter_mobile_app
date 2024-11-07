import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 26, 2, 80),
              Color.fromARGB(255, 45, 7, 98)
            ]),
          ),
          child: const Center(
            child: Text('Welcome!'),
          ),
        ),
      ),
    ),
  );
}
