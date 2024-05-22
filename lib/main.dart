import 'package:flutter/material.dart';
import 'package:flutter_adv_review/animation/animation-tween.dart';


import 'graphic-manipulations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationReview(),
    );
  }
}


