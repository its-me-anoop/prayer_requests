// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/views/background_view.dart';

import '../../logic/intro_page_controller.dart';
import 'views/intro_page_indicator.dart';
import 'views/intro_pages_view.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroPageController c = Get.put(IntroPageController());
    return Scaffold(
      body: BackgroundView(
        child: Stack(
          children: [const IntroPagesView(), IntroPageIndicator(c: c)],
        ),
      ),
    );
  }
}
