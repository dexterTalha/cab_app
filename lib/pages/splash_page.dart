import 'dart:async';

import 'package:cab_app/pages/welcome_page.dart';
import 'package:cab_app/widgets/app_text_bold.dart';
import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //moving to welcome page after some seconds

  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      //push replacement used to delete the splash page from stack
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WelcomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                "assets/images/welcome_1.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: AppTextBold(text: "Cab App"),
            )
          ],
        ),
      ),
    );
  }
}
