import 'package:conversor_moedas/features/currency/presentation/currency_screen.dart';
import 'package:conversor_moedas/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: CurrencyPage()
    );
  }
}
