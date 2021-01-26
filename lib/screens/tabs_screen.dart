import 'package:flutter/material.dart';
import './categories_screen.dart';
import '../models/meal.dart';
import './favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() => _selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
    );
  }
}
