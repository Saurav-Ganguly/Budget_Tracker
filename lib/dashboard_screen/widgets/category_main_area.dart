import 'package:budget_tracker/dashboard_screen/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_tracker/global_vars.dart';
import 'package:budget_tracker/providers/expenses_provider.dart';

class CategoryMainArea extends StatelessWidget {
  final CategoryTypes selectedCategory;
  const CategoryMainArea({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesData = context.watch<CategoriesProvider>().categories;

    List<Map<String, dynamic>> getSelectedCategoryList() {
      List<Map<String, dynamic>> selectedCategoryList = [];
      for (var element in categoriesData) {
        if (element["type"] == selectedCategory) {
          selectedCategoryList.add(element);
        }
      }
      return selectedCategoryList;
    }

    Color getCategoryColor(CategoryTypes type) {
      Color categoryColor;
      if (type == CategoryTypes.expenses) {
        categoryColor = const Color(0XFFF8A69C);
      } else if (type == CategoryTypes.savings) {
        categoryColor = Colors.green.withAlpha(180);
      } else {
        categoryColor = const Color(0XFF1684AE).withAlpha(180);
      }
      return categoryColor;
    }

    return Expanded(
      child: Card(
        color: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.all(0),
        elevation: 0,
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: getSelectedCategoryList().length,
          itemBuilder: (context, index) {
            final categoryItem = getSelectedCategoryList()[index];
            return GestureDetector(
              onTap: () {},
              child: CategoryCard(
                color: getCategoryColor(selectedCategory),
                title: categoryItem['title'],
                allocatedAmt: categoryItem['allocated_amount'],
              ),
            );
          },
        ),
      ),
    );
  }
}
