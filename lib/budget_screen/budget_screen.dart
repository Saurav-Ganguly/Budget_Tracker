//flutter package
import 'package:budget_tracker/budget_screen/widgets/settings_main_area.dart';
import 'package:budget_tracker/global_vars.dart';
import 'package:flutter/material.dart';

//external libraries
import 'package:line_icons/line_icons.dart';

//file provider
import 'package:budget_tracker/providers/data_provider.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final income = context.watch<DataProvider>().income;
    //top tab bar
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //height: 150,
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.primary,
              margin: const EdgeInsets.all(
                30,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Set Monthly Income",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          LineIcons.indianRupeeSign,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          income.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Add to income",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: settingsTabs(context),
          ),
        ],
      ),
    ));
  }

//tabs
  DefaultTabController settingsTabs(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleSpacing: 20,
          foregroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
            tabs: const [
              Tab(
                text: "Expenses",
                icon: Icon(
                  LineIcons.wavyMoneyBill,
                  size: 25,
                ),
              ),
              Tab(
                text: "Savings",
                icon: Icon(
                  LineIcons.piggyBank,
                  size: 25,
                ),
              ),
              Tab(
                text: "Goals",
                icon: Icon(
                  LineIcons.check,
                  size: 25,
                ),
              ),
            ],
          ),
          // title: const Padding(
          //   padding: EdgeInsets.only(top: 15.0),
          //   child: Text(
          //     'Set Monthly Budget',
          //     style: TextStyle(
          //       fontSize: 25,
          //     ),
          //   ),
          // ),
        ),
        body: const TabBarView(
          children: [
            SettingsMainArea(selectedCategory: CategoryTypes.expenses),
            SettingsMainArea(selectedCategory: CategoryTypes.savings),
            SettingsMainArea(selectedCategory: CategoryTypes.goals),
          ],
        ),
      ),
    );
  }
}
