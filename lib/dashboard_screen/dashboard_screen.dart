import 'package:budget_tracker/dashboard_screen/widgets/category_main_area.dart';
import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

import 'package:budget_tracker/dashboard_screen/widgets/dashboard_category_tab.dart';
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  CategoryTypes selectedCategory = CategoryTypes.expenses;
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
                                selectedCategory = CategoryTypes.expenses;
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive:
                                  selectedCategory == CategoryTypes.expenses,
                              label: CategoryTypes.expenses.name,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = CategoryTypes.savings;
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive:
                                  selectedCategory == CategoryTypes.savings,
                              label: CategoryTypes.savings.name,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = CategoryTypes.goals;
                              });
                            },
                            child: DashboardCategoryTab(
                              isActive: selectedCategory == CategoryTypes.goals,
                              label: CategoryTypes.goals.name,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                CategoryMainArea(
                  selectedCategory: selectedCategory,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
