import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //main Card
          DashboardMainCard(
            name: 'Saurav',
            month: 'September',
          ),
        ],
      ),
    );
  }
}
