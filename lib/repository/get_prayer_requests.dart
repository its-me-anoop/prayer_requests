import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayer_requests/models/prayer_request_card_model.dart';

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('prayer-requests');

List<PrayerRequest> prayerRequestList = [];

Future<List<PrayerRequest>> getData() async {
  // Get docs from collection reference

  QuerySnapshot querySnapshot = await _collectionRef
      .orderBy('timeadded', descending: true)
      .limitToLast(100)
      .get();

  // Get data from docs and convert map to List
  List<PrayerRequest> allData = querySnapshot.docs.map<PrayerRequest>((doc) {
    return PrayerRequest(doc['userid'], doc['prayer'], doc['timeadded']);
  }).toList();
  allData.shuffle();
  prayerRequestList.clear();
  prayerRequestList = allData;

  return allData;
}
