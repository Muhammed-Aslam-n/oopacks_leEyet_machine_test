import 'package:flutter/material.dart';
import 'package:oopacks/constants/app_theme.dart';
import 'package:oopacks/providers/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/common_widgets.dart';
import '../../widgets/home_screen_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: 'Settings',
        appBarHeight: 60,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              tileColor: Colors.grey.shade800,
              title: PoppinsText(
                data: 'Turn on Dark theme',
                color: Theme.of(context).highlightColor,
              ),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context).currentTheme ==
                    MyTheme.darkTheme,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
