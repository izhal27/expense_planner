import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, int) addTransactionHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              autofocus: true,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                addTransactionHandler(
                    titleController.text, int.tryParse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
