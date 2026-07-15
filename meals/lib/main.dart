import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, secondary: Colors.amber, primary: Colors.pink,   ),
        useMaterial3: true,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Raleway',
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        )
      ),
      routes: {
        AppRoutes.home:(context) => CategoriesScreen(),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(),
        AppRoutes.mealDetails:(context) => MealDetailScreen(),
      },
    );
  }
}
