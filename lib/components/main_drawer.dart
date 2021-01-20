import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(
      {BuildContext context, IconData icon, String label, String route}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            context: context,
            icon: Icons.restaurant,
            label: 'Refeições',
            route: AppRoutes.HOME,
          ),
          _createItem(
            context: context,
            icon: Icons.settings,
            label: 'Configurações',
            route: AppRoutes.SETTINGS,
          ),
        ],
      ),
    );
  }
}
