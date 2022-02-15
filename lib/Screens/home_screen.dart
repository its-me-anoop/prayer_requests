import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/views/background_view.dart';

import 'splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundView(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.currentUser
                ?.delete()
                .whenComplete(() => Get.to(
                      const SplashScreen(),
                      transition: Transition.native,
                      popGesture: false,
                    ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text("Get Started"),
            ),
          ),
        ),
      ))),
    );
  }
}
