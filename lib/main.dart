import 'package:evo_movie/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:evo_movie/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home()
  },
  theme: ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 26, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // Defina outros estilos conforme necessário
    ),
  ),
));