import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the brightness to dark
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}