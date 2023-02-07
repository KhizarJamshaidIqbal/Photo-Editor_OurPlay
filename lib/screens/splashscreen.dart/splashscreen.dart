// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_editer_tool/screens/HomeScreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: AssetImage('assets/images/Photo Editor.png'),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                ),
                child:
                    AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
                  TyperAnimatedText('Photo Editor',
                      speed: Duration(milliseconds: 100)),
                ]),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
