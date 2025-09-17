import 'dart:convert';
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
}
