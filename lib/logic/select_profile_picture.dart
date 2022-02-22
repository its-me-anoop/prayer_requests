import 'dart:math';

import 'package:get/get.dart';
import 'package:prayer_requests/constants/profile_pics.dart';

class ProfilePicSelectionController extends GetxController {
  var selectedPicture =
      profilePics[Random().nextInt(profilePics.length)].toString().obs;
  final userName = 'user'.obs;

  updateSelectedPicture(String url) => selectedPicture(url);

  updateUserName(String name) => userName(name);
}
