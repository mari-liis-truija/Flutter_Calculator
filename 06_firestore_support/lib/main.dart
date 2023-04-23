import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/history_screen.dart';
import 'package:flutter_calculator/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/calculator_screen.dart';

Future<bool> isLoggedIn() async {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}

void main() async {
  String initialRoute = '/';

  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the brightness to dark
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/calculator': (context) => CalculatorScreen(),
        '/login': (context) => CalculatorScreen(),
      },
    );
  }
}