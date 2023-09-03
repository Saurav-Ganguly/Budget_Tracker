import 'package:flutter/material.dart';

import 'package:budget_tracker/dashboard_screen/widgets/category_card.dart';
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_category_tab.dart';
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final categories = ['Expenses', 'Savings', 'Goals'];
  String selectedCategory = 'Expenses';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //main Card
        const DashboardMainCard(
          name: 'Saurav',
          month: 'September',
        ),
        //categories tab
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[0];
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive: selectedCategory == categories[0],
                              label: 'Expenses',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[1];
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive: selectedCategory == categories[1],
                              label: 'Savings',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categories[2];
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive: selectedCategory == categories[2],
                              label: 'Goals',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Theme.of(context).colorScheme.background,
                    margin: const EdgeInsets.all(0),
                    elevation: 0,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
