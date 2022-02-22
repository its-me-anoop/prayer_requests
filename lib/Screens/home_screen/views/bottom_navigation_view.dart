import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/page_selection_controller.dart';
import '../../prayer_request_screen/views/prayer_request_input.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageSelectionController _page = Get.put(PageSelectionController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Stack(
            children: [
              SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PrayerRequestInput(),
                      Obx(() => BottomNavigationBar(
                              onTap: (index) {
                                _page.pageController.value.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                                if (index == 0) {
                                  _page.showInput(true);
                                } else {
                                  _page.showInput(false);
                                }
                              },
                              currentIndex: _page.selectedPage.value,
                              backgroundColor: Colors.transparent,
                              selectedItemColor: Theme.of(context).primaryColor,
                              showUnselectedLabels: false,
                              unselectedItemColor:
                                  Theme.of(context).primaryColor,
                              elevation: 0,
                              items: const [
                                BottomNavigationBarItem(
                                    activeIcon: Icon(
                                      Icons.emoji_people_outlined,
                                      size: 30,
                                    ),
                                    icon: Icon(
                                      Icons.emoji_people_outlined,
                                    ),
                                    label: 'Prayer Request'),
                                BottomNavigationBarItem(
                                    activeIcon: Icon(
                                      Icons.emoji_events,
                                      size: 30,
                                    ),
                                    icon: Icon(
                                      Icons.emoji_events_outlined,
                                    ),
                                    label: 'Testimonies')
                              ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
