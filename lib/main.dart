// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/splashscreen.dart/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Editer Tool',
      theme: ThemeData.dark(),
      home: splashscreen(),
    );
  }}
