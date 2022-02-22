import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

User? currentUser = FirebaseAuth.instance.currentUser;

final box = GetStorage();
