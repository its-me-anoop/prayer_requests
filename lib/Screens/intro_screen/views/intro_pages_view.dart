import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/intro_page_controller.dart';
import 'intro_page1.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';

class IntroPagesView extends StatelessWidget {
  const IntroPagesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroPageController c = Get.put(IntroPageController());
    return PageView(
      onPageChanged: (index) {
        c.currentPage(index);
      },
      children: const [IntroPage1(), IntroPage2(), IntroPage3()],
    );
  }
}
