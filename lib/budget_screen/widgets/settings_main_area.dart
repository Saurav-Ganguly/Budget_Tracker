//flutter package
import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//external libraries
import 'package:provider/provider.dart';

//provider
import 'package:budget_tracker/providers/data_provider.dart';

//file imports
import 'package:budget_tracker/budget_screen/widgets/budget_settings_card.dart';
import 'package:budget_tracker/widgets/add_category_dialog.dart';

class SettingsMainArea extends StatelessWidget {
  final CategoryTypes selectedCategory;
  const SettingsMainArea({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    //addes the data according to the category
    void addNewCategory(Map<String, dynamic> data) {
      context
          .read<DataProvider>()
          .addItem(item: data, category: selectedCategory);
    }

    //removes the data according to the category
    void removeCategory(Map<String, dynamic> data) {
      context
          .read<DataProvider>()
          .removeItem(item: data, category: selectedCategory);
    }

    //edits a category
    void editCategory(
      String id,
      Map<String, dynamic> newData,
    ) {
      context.read<DataProvider>().editItem(
            id: id,
            newItem: newData,
            category: selectedCategory,
          );
    }

    List<Map<String, dynamic>> getData() {
      List<Map<String, dynamic>> data = [];
      if (selectedCategory == CategoryTypes.expenses) {
        data = context.watch<DataProvider>().expenses;
      } else if (selectedCategory == CategoryTypes.savings) {
        data = context.watch<DataProvider>().savings;
      } else if (selectedCategory == CategoryTypes.goals) {
        data = context.watch<DataProvider>().goals;
      }
      return data;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //show
          showDialog(
            context: context,
            builder: (context) {
              //dialog box to add a entry
              return AddCategoryDialog(
                addItem: addNewCategory,
                category: selectedCategory,
              );
            },
          );
        },
        label: Text('New ${selectedCategory.name}'),
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
                itemCount: getData().length,
                itemBuilder: (context, index) {
                  final item = getData()[index];
                  return BudgetSettingsCard(
                    data: item,
                    removeItem: removeCategory,
                    editItem: editCategory,
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
