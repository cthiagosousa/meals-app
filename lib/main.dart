import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_datail_screen.dart';
import './screens/settings_screen.dart';
import './utils/app_routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(),
      },
    );
  }
}
