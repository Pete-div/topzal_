import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topzal_app/app_typograp.dart';
import 'package:topzal_app/theme/class_controller.dart';

class MyHomePage extends StatefulWidget  {
   MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
 }

class _MyHomePageState extends State<MyHomePage> with RestorationMixin{
 final RestorableInt _counter = RestorableInt(0);
  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }

  void updateThemeMode(ThemeMode themeMode) {
    // 5. Update ThemeMode.
    context.read<AppTheme>().themeMode = themeMode;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.appColors.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              // Usage of custom typography with text theme extension.
              style: context.theme.appTextTheme.body1.copyWith(color: context.theme.appColors.onBackground,),
            ),
            Text(
              '${_counter.value}',
              // Usage of custom typography without text theme extension.
              style: AppTypography.h1.copyWith(
                color: context.theme.appColors.primary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.light),
                  child: const Text('Light'),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.dark),
                  child: const Text('Dark'),
                ),
                TextButton(
                  onPressed: () => updateThemeMode(ThemeMode.system),
                  child: const Text('System'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: context.theme.appColors.primary,
        foregroundColor: context.theme.appColors.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
  
  @override
  // TODO: implement restorationId
  String? get restorationId => 'counter_screen';
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_counter, "counter");
  }
}