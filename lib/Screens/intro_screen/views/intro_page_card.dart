import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'intro_page_card_body.dart';
import 'intro_page_card_header.dart';

class IntroPageCard extends StatelessWidget {
  const IntroPageCard({
    required this.footerWidget,
    Key? key,
  }) : super(key: key);

  final Widget footerWidget;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: Card(
        color: Theme.of(context).cardColor.withOpacity(0.3),
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.2),
        elevation: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const IntroPageCardHeader(),
                      const Divider(),
                      const IntroPageCardBody(),
                      const Divider(),
                      footerWidget
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
