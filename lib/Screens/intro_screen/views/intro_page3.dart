import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/constants/profile_pics.dart';
import 'package:prayer_requests/logic/select_profile_picture.dart';
import 'package:prayer_requests/repository/get_prayer_requests.dart';

import '../../../constants/current_user.dart';
import '../../../repository/add_user.dart';
import '../../splash_screen.dart';
import 'intro_page_title.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilePicSelectionController _pic =
        Get.put(ProfilePicSelectionController());

    TextEditingController _name = TextEditingController();

    setProfilePic() async {}

    /// The user selects a file, and the task is added to the list.

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePicDisplay(pic: _pic),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(_pic.userName.value)),
            ),
            const IntroPageTitle(title: "Customise your profile"),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Select a profile picture"),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                cacheExtent: 1000,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Bounceable(
                      scaleFactor: 0.5,
                      duration: const Duration(milliseconds: 300),
                      reverseDuration: const Duration(milliseconds: 300),
                      onTap: () {
                        setProfilePic();
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.5),
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: profilePics.map((pic) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Obx(() => SizedBox(
                              height: 100,
                              width: 100,
                              child: (pic == _pic.selectedPicture.value)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        color: Colors.grey[100]!,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(pic),
                                        ),
                                      ),
                                    )
                                  : Bounceable(
                                      scaleFactor: 0.5,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      reverseDuration:
                                          const Duration(milliseconds: 300),
                                      onTap: () {
                                        _pic.updateSelectedPicture(pic);
                                        box.write('profilePic', pic);
                                        FirebaseAuth.instance.currentUser
                                            ?.updatePhotoURL(pic);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(pic),
                                        // child: CachedNetworkImageBuilder(
                                        //     url: pic,
                                        //     builder: (img) {
                                        //       return Image.file(img);
                                        //     }),
                                      ),
                                    ),
                            )),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: CupertinoTextField(
                placeholder: "User Name",
                controller: _name,
                keyboardType: TextInputType.name,
                onSubmitted: (name) {
                  if (name != "") {
                    _pic.updateUserName(name);
                    box.write('displayName', name);
                    FirebaseAuth.instance.currentUser?.updateDisplayName(name);
                  } else {}
                },
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[100]!)),
              ),
            ),
            GetStartedButton(pic: _pic),
          ],
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    required ProfilePicSelectionController pic,
  })  : _pic = pic,
        super(key: key);

  final ProfilePicSelectionController _pic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signInAnonymously().whenComplete(() {
              FirebaseAuth.instance.currentUser
                  ?.updatePhotoURL(_pic.selectedPicture.value)
                  .whenComplete(() => FirebaseAuth.instance.currentUser
                      ?.updateDisplayName((_pic.userName.value != "")
                          ? _pic.userName.value
                          : "User_" +
                              DateTime.now().millisecondsSinceEpoch.toString()))
                  .whenComplete(() => addUser(_pic.selectedPicture.value))
                  .whenComplete(() => getData().whenComplete(() => Get.to(
                      const SplashScreen(),
                      transition: Transition.rightToLeftWithFade,
                      opaque: false,
                      popGesture: false,
                      curve: Curves.decelerate)));
            });
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text("Get Started"),
          )),
    );
  }
}

class ProfilePicDisplay extends StatelessWidget {
  const ProfilePicDisplay({
    Key? key,
    required ProfilePicSelectionController pic,
  })  : _pic = pic,
        super(key: key);

  final ProfilePicSelectionController _pic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Obx(() => CircleAvatar(
              backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
              foregroundImage: NetworkImage(_pic.selectedPicture.value),
            )),
      ),
    );
  }
}
