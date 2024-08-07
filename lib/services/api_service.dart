import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = "GKIEXAQKRRSLQFDR";
  final String apiUrl = "https://www.alphavantage.co/query";

  Future<List<dynamic>> getStocks() async {
    final response = await http.get(
      Uri.parse('$apiUrl?function=TIME_SERIES_DAILY&symbol=IBM&apikey=$apiKey'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> stocks = data["Time Series (Daily)"].entries.map((entry) {
        return {
          "date": entry.key ?? "Unknown",
          "price": entry.value["4. close"] ?? "0.0",
        };
      }).toList();
      return stocks;
    } else {
      throw Exception('Failed to load stocks');
    }
  }
}
