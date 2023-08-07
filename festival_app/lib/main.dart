import 'package:festival_app/utils/MyRoutes.dart';
import 'package:festival_app/views/screens/Home_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // colorSchemeSeed:
      ),
      initialRoute: MyRoutes.Splash_Screen,
      routes: {
        MyRoutes.Home: (context) => const HomePage(),
      },
    );
  }
}
