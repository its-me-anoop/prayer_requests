import 'package:flutter/material.dart';

class PrayerRequestFooterText extends StatelessWidget {
  const PrayerRequestFooterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("1 user prayed"),
    ));
  }
}
