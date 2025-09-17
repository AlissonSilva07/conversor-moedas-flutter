import 'package:conversor_moedas/data/repository/currency_repository.dart';
import 'package:conversor_moedas/domain/entities/currency_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository _repository;

  CurrencyBloc(this._repository) : super(CurrencyInitial()) {
    on<FetchCurrencies>(_onFetchCurrencies);
    on<UpdateCurrency>(_onUpdateCurrency);
  }

  void _onFetchCurrencies(
    FetchCurrencies event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(CurrencyLoading());
    try {
      final Map<String, dynamic> fetchedData = await _repository
          .fetchCurrencies();
      final List<Currency> list = fetchedData.entries.map((entry) {
        return Currency(code: entry.key, name: entry.value);
      }).toList();

      final String defaultFrom = list
          .firstWhere((c) => c.code == 'BRL', orElse: () => list.first)
          .code;

      final String defaultTo = list
          .firstWhere((c) => c.code == 'EUR', orElse: () => list.last)
          .code;
      emit(
        CurrencyLoaded(
          currencies: list,
          valueFrom: 1,
          valueTo: 0,
          currencyFrom: defaultFrom,
          currencyTo: defaultTo,
        ),
      );
    } catch (e) {
      emit(CurrencyError());
    }
  }

  void _onUpdateCurrency(UpdateCurrency event, Emitter<CurrencyState> emit) {
    if (state is CurrencyLoaded) {
      final loadedState = state as CurrencyLoaded;
      final String from = event.inputType == 'from'
          ? event.selectedCode
          : loadedState.currencyFrom;
      final String to = event.inputType == 'to'
          ? event.selectedCode
          : loadedState.currencyTo;

      emit(
        CurrencyLoaded(
          currencies: loadedState.currencies,
          valueFrom: loadedState.valueFrom,
          valueTo: loadedState.valueTo,
          currencyFrom: from,
          currencyTo: to,
        ),
      );
    }
  }
}
