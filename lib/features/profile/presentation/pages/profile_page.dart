import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/notifiers/theme_notifier.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ThemeNotifier themeNotifier; 



  @override
  void didChangeDependencies() {
    themeNotifier = Provider.of<ThemeNotifier>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SwitchListTile(
              value: themeNotifier.themeMode == ThemeMode.dark ? true : false,
              activeColor: Colors.green,
              onChanged: (value) {
                print('object');
                themeNotifier.themeMode == ThemeMode.light
                    ? themeNotifier.setTheme(ThemeMode.dark)
                    : themeNotifier.setTheme(ThemeMode.light);
              },
              title: Text('Dark Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
