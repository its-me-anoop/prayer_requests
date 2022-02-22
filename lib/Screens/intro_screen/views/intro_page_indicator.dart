// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/intro_page_controller.dart';

class IntroPageIndicator extends StatelessWidget {
  const IntroPageIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IntroPageController c = Get.put(IntroPageController());
    return Obx(() => (c.pageIndex.value == 2)
        ? const SizedBox()
        : SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 10,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Obx(() => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: (c.pageIndex == index) ? 30 : 10,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(
                                            (c.pageIndex == index) ? 0.7 : 0.3),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ));
  }
}
