import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/current_user.dart';
import '../../../logic/page_selection_controller.dart';
import '../../../repository/get_prayer_requests.dart';

class PrayerRequestInput extends StatelessWidget {
  const PrayerRequestInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    final PageSelectionController _page = Get.put(PageSelectionController());

    Future<void> sendPrayerRequest(String prayer) {
      CollectionReference _prayerRequests =
          FirebaseFirestore.instance.collection('prayer-requests');
      return _prayerRequests.add({
        'userid': FirebaseAuth.instance.currentUser?.uid,
        'prayer': prayer,
        'timeadded': FieldValue.serverTimestamp(),
      }).whenComplete(() {
        getData();
      });
    }

    return Obx(() => (_page.showPrayerRequestInput.isTrue)
        ? Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
                foregroundImage: NetworkImage(box.read('profilePic')),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CupertinoTextField(
                  prefix: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.create_outlined),
                  ),
                  placeholder: "Enter your prayer request",
                  keyboardType: TextInputType.text,
                  maxLength: 280,
                  controller: _textController,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.1),
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(50)),
                  onSubmitted: (value) {
                    if (value != "") {
                      sendPrayerRequest(value).whenComplete(() {
                        _textController.clear();
                      });
                    }
                  },
                  textInputAction: TextInputAction.send,
                ),
              ),
            ],
          )
        : const SizedBox());
  }
}
