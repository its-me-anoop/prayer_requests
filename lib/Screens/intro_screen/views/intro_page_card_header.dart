import 'package:flutter/material.dart';

import '../../../constants/sample_user.dart';

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
          foregroundImage: NetworkImage(sampleProfilePic),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sampleName),
          ),
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
