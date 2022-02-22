import 'dart:io';

import 'package:flutter/material.dart';

import '../home_screen/views/android_appbar.dart';
import '../home_screen/views/ios_appbar.dart';
import 'views/prayer_request_list_view.dart';

class PrayerRequestScreen extends StatelessWidget {
  const PrayerRequestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (Platform.isAndroid)
          const AndroidAppBar()
        else
          const IosAppBar(
            pageTitle: "Prayer Request",
          ),
        const PrayerRequestListView(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 200),
        ),
      ],
    );
  }
}
