import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../repository/get_prayer_requests.dart';
import 'prayer_request_card_body.dart';
import 'prayer_request_card_header.dart';
import 'prayer_request_footer_text.dart';

class PrayerRequestCard extends StatelessWidget {
  const PrayerRequestCard({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Bounceable(
        onTap: () {},
        child: Card(
          color: Theme.of(context).cardColor.withOpacity(0.3),
          shadowColor: Theme.of(context).shadowColor.withOpacity(0.2),
          elevation: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 200,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PrayerRequestCardHeader(
                        userId: prayerRequestList[index].userId,
                        timeAdded: prayerRequestList[index].timeAdded,
                      ),
                      const Divider(),
                      PrayerRequestCardBody(
                          prayer: prayerRequestList[index].prayer),
                      const Divider(),
                      const PrayerRequestFooterText()
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
