import 'package:flutter/material.dart';
import 'package:uzgaruvchi/views/screens/home_screen.dart';
import 'package:uzgaruvchi/views/screens/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Menu"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen();
                  },
                ),
              );
            },
            leading: const Icon(
              (Icons.home),
            ),
            title: const Text("Home Page"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen();
                  },
                ),
              );
            },
            leading: const Icon(
              (Icons.settings),
            ),
            title: const Text("Settings"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
