import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_requests/views/background_view.dart';

import '../../logic/page_selection_controller.dart';

import '../prayer_request_screen/prayer_request_screen.dart';
import 'views/bottom_navigation_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageSelectionController _page = Get.put(PageSelectionController());

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: BackgroundView(
          child: Stack(
            children: [
              Obx(() => PageView(
                    controller: _page.pageController.value,
                    onPageChanged: (index) {
                      if (index == 0) {
                        _page.changePage(index);
                        _page.showInput(true);
                      } else {
                        _page.changePage(index);
                        _page.showInput(false);
                      }
                    },
                    children: const [
                      PrayerRequestScreen(),
                      Center(
                        child: Text("Page 2"),
                      ),
                    ],
                  )),
              const BottomNavigationView()
            ],
          ),
        ));
  }
}
