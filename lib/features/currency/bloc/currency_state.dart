part of 'currency_bloc.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyFrom extends CurrencyState {}
class CurrencyTo extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;
  final double valueFrom;
  final double valueTo;
  final String currencyFrom;
  final String currencyTo;
  CurrencyLoaded({
    required this.currencies, 
    required this.valueFrom, 
    required this.valueTo,
    required this.currencyFrom,
    required this.currencyTo
  });
}

class CurrencyError extends CurrencyState {}