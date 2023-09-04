//flutter
import 'package:flutter/material.dart';

//global variables
import 'package:budget_tracker/global_vars.dart';

//external libraries
import 'package:provider/provider.dart';

//providers
import 'package:budget_tracker/providers/data_provider.dart';

//file imports
import 'package:budget_tracker/dashboard_screen/widgets/category_area/widgets/category_card.dart';
import 'package:budget_tracker/dashboard_screen/widgets/category_area/widgets/dashboard_category_tab.dart';

class CategoryArea extends StatefulWidget {
  const CategoryArea({super.key});

  @override
  State<CategoryArea> createState() => _CategoryAreaState();
}

//needs state - to manage the tab selection and switch
class _CategoryAreaState extends State<CategoryArea> {
  //get the provider according to the selected category
  List<Map<String, dynamic>> getSelectedCategoryList() {
    if (selectedCategory == CategoryTypes.expenses) {
      return context.watch<DataProvider>().expenses;
    } else if (selectedCategory == CategoryTypes.savings) {
      return context.watch<DataProvider>().savings;
    } else {
      return context.watch<DataProvider>().goals;
    }
  }

  //get the color according to the selected category
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

  //expenses is the default selected category
  CategoryTypes selectedCategory = CategoryTypes.expenses;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Tab Bar - to choose a category
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
                          isActive: selectedCategory == CategoryTypes.expenses,
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
                          isActive: selectedCategory == CategoryTypes.savings,
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
            //Main display of the category cards
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}
