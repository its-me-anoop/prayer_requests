import 'package:cloud_firestore/cloud_firestore.dart';

class PrayerRequest {
  String userId;
  String prayer;
  Timestamp timeAdded;

  PrayerRequest(this.userId, this.prayer, this.timeAdded);
}
