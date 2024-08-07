import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final dynamic stock;

  StockCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(stock['date'] ?? "Unknown"),
        subtitle: Text('Price: ${stock['price'] ?? "0.0"}'),
      ),
    );
  }
}
