import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Row(
            children: [DiceButton(diceNumber: 1), DiceButton(diceNumber: 2)],
          ),
        ),
      ),
    );
  }
}

class DiceButton extends StatelessWidget {
  final int diceNumber;

  const DiceButton({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.asset('assets/images/dice$diceNumber.svg'),
      ),
    );
  }
}
