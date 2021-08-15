import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = recentTransaction.fold(0, (p, tx) {
        if (tx.date.day == weekDay.day &&
            tx.date.year == weekDay.year &&
            tx.date.month == weekDay.month) {
          return p + tx.amount;
        }

        return p;
      });

      return {
        'day': DateFormat.E(Platform.localeName).format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get _totalSpending {
    return groupedTransactionValues.fold(
      0.0,
      (previousValue, item) => previousValue + item['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPercentOfAmount: _totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / _totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
