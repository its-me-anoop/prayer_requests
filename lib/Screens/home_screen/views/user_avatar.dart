import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.uid, required this.radius})
      : super(key: key);

  final String uid;
  final double radius;

  @override
  Widget build(BuildContext context) {
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: _users.doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CircleAvatar(
              radius: radius,
              backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return CircleAvatar(
              radius: radius,
              backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return CircleAvatar(
              radius: radius,
              backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
              foregroundImage: NetworkImage(data['photo']),
            );
          }
          return CircleAvatar(
            backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
          );
        });
  }
}
