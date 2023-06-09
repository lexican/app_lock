import 'package:app_lock/app_lock.dart';
import 'package:example/features/home/home.dart';
import 'package:example/features/lock/lock.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppLock(
      builder: (args) {
        return MaterialApp(
          title: 'Flutter App Lock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: <String, WidgetBuilder>{
            '/': (context) => const Home(),
          },
        );
      },
      enabled: false,
      lockScreen: const Lock(),
    );
  }
}
