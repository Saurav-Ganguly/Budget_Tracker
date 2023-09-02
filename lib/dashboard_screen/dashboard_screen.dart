import 'package:budget_tracker/dashboard_screen/widgets/dashboard_category_tab.dart';
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //main Card
          const DashboardMainCard(
            name: 'Saurav',
            month: 'September',
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashboardCategoryTab(
                      isActive: true,
                      color: Theme.of(context).primaryColor,
                      label: 'Expenses',
                    ),
                    DashboardCategoryTab(
                      isActive: false,
                      color: Colors.grey[50],
                      label: 'Savings',
                    ),
                    DashboardCategoryTab(
                      isActive: false,
                      color: Colors.grey[50],
                      label: 'Goals',
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
