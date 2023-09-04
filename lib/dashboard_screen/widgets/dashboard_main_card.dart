//flutter package
import 'package:flutter/material.dart';

//external libraries
import 'package:line_icons/line_icons.dart';

//file imports
import 'package:budget_tracker/dashboard_screen/widgets/dashboard_main_card_data_chips.dart';

class DashboardMainCard extends StatelessWidget {
  final String month;
  final String name;
  // TODO: add all the final fields i.e. income, saving & expenses
  const DashboardMainCard({
    super.key,
    required this.month,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    //border of the card
    const borderRadiusTopCard = BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    );

    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 15,
      shape: const RoundedRectangleBorder(borderRadius: borderRadiusTopCard),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadiusTopCard,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $name !',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    'Your overall for the month of $month,',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardMainCardDataChips(
                          icon: LineIcons.indianRupeeSign,
                          label: 'Income',
                          amount: '50,000', //TODO: add income
                        ),
                        DashboardMainCardDataChips(
                          icon: LineIcons.piggyBank,
                          label: 'Savings',
                          amount: '20,000', //TODO: add saving
                        ),
                        DashboardMainCardDataChips(
                          icon: LineIcons.wavyMoneyBill,
                          label: 'Expenses',
                          amount: '20,000', //TODO: add expenses
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Avilable Balance',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    'Rs 20,000', //TODO: calculate balance
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
