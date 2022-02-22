import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(String tempImg) {
  // Call the user's CollectionReference to add a new user
  return users.doc(FirebaseAuth.instance.currentUser?.uid).set({
    'userid': FirebaseAuth.instance.currentUser?.uid,
    'photo': tempImg,
    'name': FirebaseAuth.instance.currentUser?.displayName ??
        'User_' + DateTime.now().millisecondsSinceEpoch.toString(),
    'timeadded': FieldValue.serverTimestamp(),
    'email': FirebaseAuth.instance.currentUser?.email ?? ""
  });
}
