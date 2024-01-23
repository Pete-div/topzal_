import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topzal_app/home_page.dart';
import 'package:topzal_app/theme/app_theme.dart';
import 'package:topzal_app/theme/class_controller.dart';

void main() {
  runApp(RootRestorationScope(child: const MyApp(),restorationId: 'root',));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp(
        title: 'Observe',
        theme: AppThemeClass.light,
        darkTheme: AppThemeClass.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
      home:  MyHomePage(title: 'Observable'),
    ));
  }
}

