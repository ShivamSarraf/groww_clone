import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/stock_card.dart';

class PortfolioScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getStocks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List stocks = snapshot.data ?? [];
          return ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              return StockCard(stock: stocks[index]);
            },
          );
        }
      },
    );
  }
}
