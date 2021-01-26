import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();

    settings = widget.settings;
  }

  Widget _createSwitch({
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    title: 'Sem Glutén',
                    subtitle: 'Só exibe refeições sem glutén.',
                    value: settings.isGlutenFree,
                    onChanged: (value) =>
                        setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    title: 'Sem Lactose',
                    subtitle: 'Só exibe refeições sem lactose.',
                    value: settings.isLactoseFree,
                    onChanged: (value) =>
                        setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    title: 'Vegana',
                    subtitle: 'Só exibe refeições vegana.',
                    value: settings.isVegan,
                    onChanged: (value) =>
                        setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    title: 'Vegetariana',
                    subtitle: 'Só exibe refeições vegetariana.',
                    value: settings.isVegetarian,
                    onChanged: (value) =>
                        setState(() => settings.isVegetarian = value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
