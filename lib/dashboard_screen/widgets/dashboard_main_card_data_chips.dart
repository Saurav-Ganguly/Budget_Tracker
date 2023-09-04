import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardMainCardDataChips extends StatelessWidget {
  final IconData icon;
  final String label;
  String? amount;
  DashboardMainCardDataChips({
    super.key,
    required this.icon,
    required this.label,
    this.amount,
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
            amount != null
                ? Text(
                    amount!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
