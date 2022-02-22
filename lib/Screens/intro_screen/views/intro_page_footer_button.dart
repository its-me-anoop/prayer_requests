import 'package:flutter/material.dart';

class IntroPageFooterButton extends StatelessWidget {
  const IntroPageFooterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text("Make a prayer"));
  }
}
