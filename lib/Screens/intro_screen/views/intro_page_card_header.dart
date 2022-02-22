import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prayer_requests/constants/profile_pics.dart';

class IntroPageCardHeader extends StatelessWidget {
  const IntroPageCardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).cardColor.withOpacity(0.3),
          foregroundImage:
              NetworkImage(profilePics[Random().nextInt(profilePics.length)]),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("John"),
          ),
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
