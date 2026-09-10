import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  void rollLeftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void rollRightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Row(
            children: [
              DiceButton(diceNumber: leftDiceNumber, onTap: rollLeftDice),
              DiceButton(diceNumber: rightDiceNumber, onTap: rollRightDice),
            ],
          ),
        ),
      ),
    );
  }
}

class DiceButton extends StatelessWidget {
  final int diceNumber;
  final VoidCallback onTap;
  const DiceButton({super.key, required this.diceNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset('assets/images/dice$diceNumber.svg'),
        ),
      ),
    );
  }
}
