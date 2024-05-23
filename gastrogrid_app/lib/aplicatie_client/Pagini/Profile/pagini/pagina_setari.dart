import 'package:flutter/material.dart';
import 'package:gastrogrid_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PaginaSetari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Setări Aplicație'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Mod Întunecat', style: TextStyle(fontSize: themeProvider.textSize)),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Column(
                children: [
                  Text(
                    'Dimensiune text',
                    style: TextStyle(fontSize: themeProvider.textSize, fontWeight: FontWeight.bold),
                  ),
                  Slider(
              value: themeProvider.textSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: themeProvider.textSize.toString(),
              onChanged: (double newValue) {
                themeProvider.changeTextSize(newValue);
              },
            ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Notificări', style: TextStyle(fontSize: themeProvider.textSize)),
              value: themeProvider.notificationsEnabled,
              onChanged: (value) {
                themeProvider.toggleNotifications();
              },
            ),
          ],
        ),
      ),
    );
  }
}
