import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/intro_page_controller.dart';
import 'intro_page_card.dart';
import 'intro_page_footer_text.dart';
import 'intro_page_title.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroPageController c = Get.put(IntroPageController());
    c.pageIndex = 0.obs;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IntroPageTitle(
              title: "Request Prayers from Global Community",
            ),
            IntroPageCard(
              footerWidget: IntroPageFooterText(),
            )
          ],
        ),
      ),
    );
  }
}
