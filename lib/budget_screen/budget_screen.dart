import 'package:budget_tracker/budget_screen/widgets/expense_setting.dart';
import 'package:budget_tracker/budget_screen/widgets/goal_setting.dart';
import 'package:budget_tracker/budget_screen/widgets/saving_setting.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleSpacing: 20,
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
