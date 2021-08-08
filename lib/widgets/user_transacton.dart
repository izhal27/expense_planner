import 'dart:math';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = new List<Transaction>.generate(
    (1),
    (index) => Transaction(
      id: index.toString(),
      title: 'Stuff ${index + 1}',
      amount: Random().nextInt(90000) + 10000,
      date: DateTime.now(),
    ),
  );

  void _addNewTrasaction(String txTitle, int txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTrasaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
