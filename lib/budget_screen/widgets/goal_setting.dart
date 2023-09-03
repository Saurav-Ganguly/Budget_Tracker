import 'package:budget_tracker/budget_screen/widgets/budget_settings_card.dart';
import 'package:budget_tracker/providers/goals_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class GoalsSetting extends StatelessWidget {
  const GoalsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = context.watch<GoalsProvider>().goals;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New Goal'),
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
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final expense = goals[index];
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
