import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/Screens/home_screen.dart';
import 'package:prayer_requests/Screens/intro_screen/intro_screen.dart';

import '../constants/strings.dart';
import '../views/background_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      //your code goes here
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAll(
          const HomeScreen(),
          transition: Transition.rightToLeftWithFade,
        );
      } else {
        Get.offAll(
          const IntroScreen(),
          transition: Transition.native,
        );
      }
    });

    return Scaffold(
      body: BackgroundView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTitle,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
