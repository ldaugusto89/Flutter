import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: Colors.red,
            primary: Colors.red,
            secondary: Colors.deepOrange,
          ),
          appBarTheme: AppBarThemeData(backgroundColor: Colors.redAccent),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              // Usando foregroundColor apontando para a cor secundária do seu tema
              foregroundColor: Colors.white,
            ),
          ),
          textTheme: TextTheme(titleLarge: TextStyle(fontFamily: 'Lato')),
        ),
        routes: {AppRoutes.productDetail: (context) => ProductDetailScreen()},
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
