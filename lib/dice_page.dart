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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tente a sorte!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Toque em um dado ou no botão abaixo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Row(
                children: [
                  DiceButton(diceNumber: leftDiceNumber, onTap: rollLeftDice),
                  DiceButton(diceNumber: rightDiceNumber, onTap: rollRightDice),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: rollBoth,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'ROLAR AMBOS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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
          borderRadius: BorderRadius.circular(
            20,
          ), // Arredonda a animação do clique
          onTap: onTap,
          child: SvgPicture.asset('assets/images/dice$diceNumber.svg'),
        ),
      ),
    );
  }
}
