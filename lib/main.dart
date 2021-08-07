import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = new List<Transaction>.generate(
    (2),
    (index) => Transaction(
      id: index.toString(),
      title: 'Stuff ${index + 1}',
      amount: Random().nextInt(90000) + 10000,
      date: DateTime.now(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var defaultLocale = Platform.localeName;
    initializeDateFormatting();

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          NumberFormat.currency(locale: defaultLocale)
                              .format(tx.amount),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMd(defaultLocale)
                                .add_jm()
                                .format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
