import 'package:get/get.dart';

class IntroPageController extends GetxController {
  var pageIndex = 0.obs;

  currentPage(int index) => pageIndex(index);
}
