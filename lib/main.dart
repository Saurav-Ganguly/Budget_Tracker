import 'package:budget_tracker/providers/expenses_provider.dart';
import 'package:budget_tracker/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:budget_tracker/settings_screen/settings_screen.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: const Color(0XFFF8F8F8),
          tertiary: const Color.fromARGB(255, 63, 192, 177),
          //generate primary secordary colors
          seedColor: const Color.fromARGB(255, 31, 147, 248),
          primary: const Color.fromARGB(255, 31, 147, 248),
          onBackground: const Color(0XFF00CAAC),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoriesProvider>(
            create: (context) => CategoriesProvider(),
          ),
          ChangeNotifierProvider<TransactionsProvider>(
            create: (context) => TransactionsProvider(),
          ),
        ],
        child: const AppRoot(),
      ),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  var currentScreen = 1;

  List<Widget> screens = const [
    SettingsScreen(),
    DashboardScreen(),
    TransactionsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentScreen,
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.settings,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
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
