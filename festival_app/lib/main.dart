import 'package:festival_app/utils/Color_util.dart';
import 'package:festival_app/utils/MyRoutes.dart';
import 'package:festival_app/views/screens/Detail_Page.dart';
import 'package:festival_app/views/screens/Editing_Page.dart';
import 'package:festival_app/views/screens/Home_Page.dart';
import 'package:festival_app/views/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: theme_1,
    systemNavigationBarColor: theme_1,
  ));

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
          // useMaterial3: true,
          // colorSchemeSeed:
          ),
      initialRoute: MyRoutes.Splash_Screen,
      routes: {
        MyRoutes.Home: (context) => const HomePage(),
        MyRoutes.Splash_Screen: (context) => const Splash_Screen(),
        MyRoutes.Editing_Page: (context) => const Editing_Page(),
        MyRoutes.Detail_Page: (context) => const Detail_Page(),
      },
    );
  }
}
