//flutter package
import 'package:flutter/material.dart';

//file imports
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card.dart';
import 'package:budget_tracker/dashboard_screen/widgets/category_area/category_area.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Main card
          //Main top designed card on dashboard
          DashboardMainCard(
            name: 'Saurav',
            month: 'September',
            // TODO: add all the inputs to the card : Income, Savings and Expenses
          ),
          //categories tab
          // the area showing the categories tab and the category card
          CategoryArea(),
        ],
      ),
    );
  }
}
