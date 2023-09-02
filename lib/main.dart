import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          tertiary: const Color.fromARGB(255, 63, 192, 177),
          //generate primary secordary colors
          seedColor: const Color.fromARGB(255, 31, 147, 248),
          primary: const Color.fromARGB(255, 31, 147, 248),
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
          bodySmall: const TextStyle(
            fontSize: 16,
          ),
        ),
        //const TextTheme(
        // titleLarge: TextStyle(

        //   fontWeight: FontWeight.bold,
        //   fontSize: 35,
        // ),
        // titleMedium: TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 20,
        // ),
        // bodySmall: TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 16,
        // ),

        //),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
