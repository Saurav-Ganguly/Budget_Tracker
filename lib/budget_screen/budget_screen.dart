//flutter package
import 'package:budget_tracker/budget_screen/widgets/settings_main_area.dart';
import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//external libraries
import 'package:line_icons/line_icons.dart';

//file imports

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //top tab bar
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
            SettingsMainArea(selectedCategory: CategoryTypes.expenses),
            SettingsMainArea(selectedCategory: CategoryTypes.savings),
            SettingsMainArea(selectedCategory: CategoryTypes.goals),
          ],
        ),
      ),
    );
  }
}
