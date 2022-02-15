import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../splash_screen.dart';
import 'intro_page_title.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IntroPageTitle(
              title: "Stay annonymous",
            ),
            const Text("You can make prayer requests annonymously"),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signInAnonymously().whenComplete(() =>
                      Get.to(const SplashScreen(),
                          transition: Transition.rightToLeftWithFade,
                          opaque: false,
                          popGesture: false,
                          curve: Curves.decelerate));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: Text("Get Started"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
