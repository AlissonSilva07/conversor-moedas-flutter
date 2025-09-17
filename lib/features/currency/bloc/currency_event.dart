part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class FetchCurrencies extends CurrencyEvent {}

class UpdateCurrency extends CurrencyEvent {
  final String selectedCode;
  final String inputType;

  UpdateCurrency({
    required this.selectedCode,
    required this.inputType
  });
}