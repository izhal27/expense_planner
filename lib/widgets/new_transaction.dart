import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, int) addTransactionHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController(
    text: '0',
  );

  NewTransaction(this.addTransactionHandler);

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransactionHandler(enteredTitle, enteredAmount);
  }

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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              enableInteractiveSelection: false,
              onTap: () {
                final value = amountController.text;

                if (value.isNotEmpty && int.parse(value) == 0) {
                  amountController.clear();
                }
              },
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
