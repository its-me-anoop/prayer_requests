import 'package:flutter/material.dart';

class PrayerRequestCardBody extends StatelessWidget {
  const PrayerRequestCardBody({
    Key? key,
    required this.prayer,
  }) : super(key: key);

  final String prayer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            prayer,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
