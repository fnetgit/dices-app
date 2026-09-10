import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

final _random = Random();
int _getRandomDice() => _random.nextInt(6) + 1;

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = _getRandomDice();
  int rightDiceNumber = _getRandomDice();

  void rollLeftDice() {
    setState(() {
      leftDiceNumber = _getRandomDice();
    });
  }

  void rollRightDice() {
    setState(() {
      rightDiceNumber = _getRandomDice();
    });
  }

  void rollBoth() {
    setState(() {
      leftDiceNumber = _getRandomDice();
      rightDiceNumber = _getRandomDice();
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
