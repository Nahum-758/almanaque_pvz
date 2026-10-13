import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PvZAlmanacApp());
}

class PvZAlmanacApp extends StatelessWidget {
  const PvZAlmanacApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Almanaque PvZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}