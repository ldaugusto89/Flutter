import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, secondary: Colors.amber, primary: Colors.pink ),
        primaryColor: Colors.pink,
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Raleway'
          ),
          titleMedium: TextStyle(
            fontFamily: 'Raleway'
          )
        )
      ),
      home: CategoriesScreen(),
    );
  }
}
