import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaliableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          secondary: Colors.amber,
          primary: Colors.pink,
        ),
        useMaterial3: true,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontFamily: 'Raleway'),
          bodyMedium: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
        ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.mealDetails: (context) => MealDetailScreen(_toggleFavorite,_isFavorite),
        AppRoutes.settings: (context) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
