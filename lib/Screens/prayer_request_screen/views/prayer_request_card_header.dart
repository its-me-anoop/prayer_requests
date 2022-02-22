import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../home_screen/views/user_avatar.dart';

class PrayerRequestCardHeader extends StatelessWidget {
  const PrayerRequestCardHeader(
      {Key? key, required this.userId, required this.timeAdded})
      : super(key: key);

  final String userId;
  final Timestamp timeAdded;

  @override
  Widget build(BuildContext context) {
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: _users.doc(userId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> header =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              children: [
                UserAvatar(uid: header['userid'], radius: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(header['name']),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          timeago.format(timeAdded.toDate()),
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz)
              ],
            );
          }
          return const SizedBox();
        });
  }
}
