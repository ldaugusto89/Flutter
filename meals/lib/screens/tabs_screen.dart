import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('vamos cozinhar'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category, color: Colors.white,), text: 'Categorias'),
              Tab(icon: Icon(Icons.star, color: Colors.white,), text: 'Favoritos'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()],),
      ),
    );
  }
}
