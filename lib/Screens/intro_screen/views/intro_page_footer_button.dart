import 'package:flutter/material.dart';

class IntroPageFooterButton extends StatelessWidget {
  const IntroPageFooterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Make a prayer",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      )),
    );
  }
}
