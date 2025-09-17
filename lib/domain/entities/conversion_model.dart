class Conversion {
  final double amount;
  final String baseCurrency;
  final String date;
  final Map<String, double> rates;

  Conversion({
    required this.amount,
    required this.baseCurrency,
    required this.date,
    required this.rates
  });

  factory Conversion.fromJson(Map<String, dynamic> json) {
    return Conversion(
      amount: json['amount'],
      baseCurrency: json['base'],
      date: json['date'],
      rates: Map<String, double>.from(json['rates']),
    );
  }
}