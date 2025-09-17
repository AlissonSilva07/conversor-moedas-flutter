import 'package:conversor_moedas/features/currency/bloc/currency_bloc.dart';
import 'package:conversor_moedas/data/repository/currency_repository.dart';
import 'package:conversor_moedas/features/currency/screens/currency_screen.dart';
import 'package:conversor_moedas/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => CurrencyBloc(CurrencyRepository())..add(FetchCurrencies()),
        child: const CurrencyPage(),
      )
    );
  }
}
