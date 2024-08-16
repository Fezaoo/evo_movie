import 'package:flutter/material.dart';
import 'package:evo_movie/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home()
  },
));