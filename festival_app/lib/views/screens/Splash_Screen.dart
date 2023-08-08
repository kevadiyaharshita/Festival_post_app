import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/MyRoutes.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  changepage() {
    Timer.periodic(Duration(seconds: 4), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.Home);
      timer.cancel();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changepage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: theme_1,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Vasant Panchami Festival.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
