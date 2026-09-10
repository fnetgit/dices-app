import 'package:dices/dice_page.dart';
import 'package:flutter/material.dart';

class DicesApp extends StatelessWidget {
  const DicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dices App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const DicePage(),
    );
  }
}

