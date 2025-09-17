import 'package:conversor_moedas/data/repository/currency_repository.dart';
import 'package:conversor_moedas/domain/entities/currency_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository _repository;

  CurrencyBloc(this._repository) : super(CurrencyInitial()) {
    on<FetchCurrencies>(_onFetchCurrencies);
  }

  void _onFetchCurrencies(FetchCurrencies event, Emitter<CurrencyState> emit) async {
    emit(CurrencyLoading());
    try {
      final currencies = await _repository.fetchCurrencies();
      final List<Currency> list = currencies.entries.map((entry) {
        return Currency(code: entry.key, name: entry.value);
      }).toList();
      emit(CurrencyLoaded(currencies: list));
    } catch (e) {
      emit(CurrencyError());
    }
  }
}