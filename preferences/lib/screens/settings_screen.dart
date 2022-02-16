import 'package:flutter/material.dart';
import 'package:preferences/providers/theme_provider.dart';
import 'package:preferences/share_preferences/preferences.dart';
import 'package:preferences/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            // controller: controller,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkmode,
                    title: const Text('Darkmode'),
                    onChanged: (value) {
                      Preferences.isDarkmode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.gender,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.gender,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),

                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'nombre', //
                        helperText: 'escribe tu nombre' //
                        ),
                  ),
                )
                //
              ],
            ),
          ),
        ));
  }
}