import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order_list.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_form_screen.dart';
import 'package:shop_app/screens/product_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
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
              foregroundColor: Colors.grey[800],
            ),
          ),
          textTheme: TextTheme(titleLarge: TextStyle(fontFamily: 'Lato')),
        ),
        routes: {
          AppRoutes.home: (context) => ProductsOverviewScreen(),
          AppRoutes.productDetail: (context) => ProductDetailScreen(),
          AppRoutes.cartDetail: (context) => CartScreen(),
          AppRoutes.orders: (context) => OrdersScreen(),
          AppRoutes.products: (context) => ProductScreen(),
          AppRoutes.productForm: (context) => ProductFormScreen(),
        },
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
