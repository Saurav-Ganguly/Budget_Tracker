import 'package:budget_tracker/budget_screen/widgets/budget_settings_card.dart';
import 'package:budget_tracker/providers/expenses_provider.dart';
import 'package:budget_tracker/providers/goals_provider.dart';
import 'package:budget_tracker/providers/savings_provider.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
            tabs: const [
              Tab(
                text: "Expenses",
                icon: Icon(
                  LineIcons.wavyMoneyBill,
                  size: 25,
                ),
              ),
              Tab(
                text: "Savings",
                icon: Icon(
                  LineIcons.piggyBank,
                  size: 25,
                ),
              ),
              Tab(
                text: "Goals",
                icon: Icon(
                  LineIcons.check,
                  size: 25,
                ),
              ),
            ],
          ),
          title: const Text(
            'Set Monthly Budget',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ExpensesSetting(),
            SavingsSetting(),
            GoalsSetting(),
          ],
        ),
      ),
    );
  }
}

class ExpensesSetting extends StatelessWidget {
  const ExpensesSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = context.watch<ExpensesProvider>().expenses;
    return Padding(
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
          ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              fixedSize: const Size(
                350,
                50,
              ),
            ),
            onPressed: () {},
            label: const Text(
              'New monthly expense',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SavingsSetting extends StatelessWidget {
  const SavingsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final savings = context.watch<SavingsProvider>().savings;
    return const Placeholder();
  }
}

class GoalsSetting extends StatelessWidget {
  const GoalsSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = context.watch<GoalsProvider>().goals;
    return const Placeholder();
  }
}
