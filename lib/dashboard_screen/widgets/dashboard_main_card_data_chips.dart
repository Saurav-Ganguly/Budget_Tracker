import 'package:flutter/material.dart';

class DashboardMainCardDataChips extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  const DashboardMainCardDataChips({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Chip(
        padding: const EdgeInsets.symmetric(vertical: 8),
        side: const BorderSide(
          color: Colors.white,
        ),
        label: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 35,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              amount,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
