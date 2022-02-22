import 'package:flutter/material.dart';

import '../../../repository/get_prayer_requests.dart';

import 'prayer_request_card.dart';

class PrayerRequestListView extends StatelessWidget {
  const PrayerRequestListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getData();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PrayerRequestCard(
            index: index,
          );
        },
        childCount: prayerRequestList.length,
      ),
    );
  }
}
