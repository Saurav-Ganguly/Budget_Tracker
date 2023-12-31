import 'package:flutter/material.dart';

class DashboardCategoryTab extends StatelessWidget {
  final bool isActive;
  final String label;

  const DashboardCategoryTab({
    super.key,
    required this.isActive,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(
        color: isActive
            ? Theme.of(context).primaryColor.withAlpha(200)
            : Colors.black,
      ),
      backgroundColor: isActive
          ? Theme.of(context).colorScheme.primary.withAlpha(200)
          : Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      label: Text(
        label,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        color: isActive ? Colors.white : Colors.black,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
    );
  }
}
