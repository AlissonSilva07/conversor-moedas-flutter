import 'dart:convert';
import 'package:conversor_moedas/domain/entities/conversion_model.dart';
import 'package:http/http.dart' as http;

class CurrencyRepository {
  final String _baseUrl = 'https://api.frankfurter.dev/v1';

  Future<Map<String, String>> fetchCurrencies() async {
    final response = await http.get(Uri.parse('$_baseUrl/currencies'));

    if (response.statusCode == 200) {
      Map<String, String> currencies = Map<String, String>.from(
        json.decode(response.body),
      );
      return currencies;
    } else {
      throw Exception('Falha ao buscar as moedas.');
    }
  }

  Future<Conversion> performConversion(
    String currencyFrom,
    String currencyTo,
  ) async {
    final Map<String, dynamic> params = {
      'base': currencyFrom,
      'symbols': currencyTo,
    };

    final Uri uri = Uri.https('api.frankfurter.dev', '/v1/latest', params);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final Conversion conversion = Conversion.fromJson(decodedBody);
      return conversion;
    } else {
      throw Exception('Falha ao realizar a conversão.');
    }
  }
}
