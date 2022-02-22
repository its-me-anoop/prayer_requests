import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageSelectionController extends GetxController {
  var selectedPage = 0.obs;
  var showPrayerRequestInput = true.obs;
  var pageController = PageController().obs;

  changePage(int pageIndex) => selectedPage(pageIndex);

  showInput(bool value) => showPrayerRequestInput(value);
}
