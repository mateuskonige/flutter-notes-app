import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(24),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dark mode", style: TextStyle(fontSize: 18)),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).isDarkMode,
                onChanged: (value) => Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
