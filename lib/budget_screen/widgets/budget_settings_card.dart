import 'package:flutter/material.dart';

class BudgetSettingsCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const BudgetSettingsCard({super.key, required this.data});

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
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        color: Theme.of(context).colorScheme.primary,
        splashRadius: 10,
      ),
    );
  }
}
