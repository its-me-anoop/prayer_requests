import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).backgroundColor,
            Theme.of(context).scaffoldBackgroundColor
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        Container(
          color: Theme.of(context).cardColor.withOpacity(0.4),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                ),
              ),
              child
            ],
          ),
        )
      ],
    );
  }
}
