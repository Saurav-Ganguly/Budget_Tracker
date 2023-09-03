import 'package:budget_tracker/budget_screen/widgets/budget_settings_card.dart';
import 'package:budget_tracker/providers/savings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingsSetting extends StatelessWidget {
  const SavingsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final savings = context.watch<SavingsProvider>().savings;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New Saving'),
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
                itemCount: savings.length,
                itemBuilder: (context, index) {
                  final expense = savings[index];
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
