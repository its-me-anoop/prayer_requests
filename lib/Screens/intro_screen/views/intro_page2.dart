import 'package:flutter/material.dart';

import 'intro_page_card.dart';
import 'intro_page_footer_button.dart';
import 'intro_page_title.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IntroPageTitle(
              title: "Pray for other users",
            ),
            IntroPageCard(
              footerWidget: IntroPageFooterButton(),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
