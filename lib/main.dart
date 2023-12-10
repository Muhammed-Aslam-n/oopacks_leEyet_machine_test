import 'package:flutter/material.dart';
import 'package:oopacks/constants/app_theme.dart';
import 'package:oopacks/providers/auth_provider.dart';
import 'package:oopacks/providers/launch_provider/launch_provider.dart';
import 'package:oopacks/providers/theme_provider/theme_provider.dart';
import 'package:oopacks/screens/authentication_screens/launcher_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LaunchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context)
            .currentTheme,
        // theme: MyTheme.lightTheme,
        // darkTheme: MyTheme.darkTheme,
        // themeMode: ThemeMode.dark,

        home: const LaunchScreen()
    );
  }
}
