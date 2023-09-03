import 'package:budget_tracker/budget_screen/widgets/add_item_dialog.dart';
import 'package:budget_tracker/budget_screen/widgets/budget_settings_card.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/providers/expenses_provider.dart';

import 'package:provider/provider.dart';

class ExpensesSetting extends StatelessWidget {
  const ExpensesSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = context.watch<ExpensesProvider>().expenses;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //show
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Add a new Monthly Expense",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                content: const AddItemDialog(),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        label: const Text('New Expense'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return BudgetSettingsCard(
                    data: expense,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
