import 'package:budget_tracker/widgets/edit_category_dialog.dart';
import 'package:flutter/material.dart';

class BudgetSettingsCard extends StatelessWidget {
  final void Function(Map<String, dynamic>) removeItem;
  final void Function(String, Map<String, dynamic>) editItem;
  final Map<String, dynamic> data;
  const BudgetSettingsCard(
      {super.key,
      required this.data,
      required this.removeItem,
      required this.editItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        child: Icon(
          Icons.home,
        ),
      ),
      title: Text(data["title"]),
      subtitle: Text(
        "Rs. ${data["allocated_amount"]} / month",
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    //dialog box to add a entry
                    return EditCategoryDialog(
                      category: data['type'],
                      data: data,
                      editItem: editItem,
                      selectedId: data['id'],
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
              splashRadius: 10,
            ),
            IconButton(
              onPressed: () {
                removeItem(data);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
              splashRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
