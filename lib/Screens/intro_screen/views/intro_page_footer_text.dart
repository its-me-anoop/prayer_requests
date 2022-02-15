import 'package:flutter/material.dart';

class IntroPageFooterText extends StatelessWidget {
  const IntroPageFooterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("386 users prayed for you"),
    ));
  }
}
