import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

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
              Image.asset('assets/images/Mention.gif'),
            ],
          ),
        ),
      ),
      // backgroundColor: theme_4,
    );
  }
}
