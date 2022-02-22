import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/Screens/splash_screen.dart';

import '../../../constants/current_user.dart';

class IosAppBar extends StatelessWidget {
  const IosAppBar({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: Colors.transparent,
      largeTitle: Text(pageTitle),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.notifications_none_outlined,
            ),
            GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.currentUser
                      ?.delete()
                      .whenComplete(() => Get.offAll(const SplashScreen()));
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
                  foregroundImage: NetworkImage(box.read('profilePic')),
                )),
          ],
        ),
      ),
    );
  }
}
