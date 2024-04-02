import 'package:flutter/material.dart';
import 'package:pace_calc/calc_screen.dart';

void main() {
  runApp(const PaceCalc());
}

class PaceCalc extends StatelessWidget {
  const PaceCalc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pace Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF094E94)),
        useMaterial3: false,
      ),
      home: CalcScreen(),
    );
  }
}
