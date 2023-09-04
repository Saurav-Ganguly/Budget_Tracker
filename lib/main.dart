//flutter packages

import 'package:flutter/material.dart';

//external libraries
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//providers
import 'package:budget_tracker/providers/data_provider.dart';

import 'package:budget_tracker/providers/transactions_provider.dart';

//file imports
import 'package:budget_tracker/budget_screen/budget_screen.dart';
import 'package:budget_tracker/transactions_screen/transactions_screen.dart';
import 'package:budget_tracker/dashboard_screen/dashboard_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme defination
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // TODO: Make the theme color scheme better
          //background color
          background: const Color(0XFFF8F8F8),
          //tertiary color - used to generate gradient on dashboard
          tertiary: const Color.fromARGB(255, 63, 192, 177),
          //generate primary & seed color is same
          seedColor: const Color.fromARGB(255, 31, 147, 248),
          primary: const Color.fromARGB(255, 31, 147, 248),
          //goal color
          onBackground: const Color(0XFF00CAAC),
        ),
        // input text field theme
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        // text theme
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          titleMedium: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          bodyLarge: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
      // all the providers
      home: MultiProvider(
        providers: [
          // for expenses
          ChangeNotifierProvider<DataProvider>(
            create: (context) => DataProvider(),
          ),
          // for transactions
          ChangeNotifierProvider<TransactionsProvider>(
            create: (context) => TransactionsProvider(),
          ),
        ],
        child: const AppRoot(),
      ),
    );
  }
}

//root widget for handling the switch between all the pages of the app
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  //at initialization the current screen is set to the dashboard
  var currentScreen = 1;

  //screens (3)
  List<Widget> screens = const [
    BudgetScreen(),
    DashboardScreen(),
    TransactionsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom navigation bar - for page switch
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: currentScreen,
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Budget',
            icon: Icon(
              Icons.pie_chart,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Transactions',
            icon: Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: screens[currentScreen],
    );
  }
}
