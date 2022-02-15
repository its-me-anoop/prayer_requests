import 'package:get/get.dart';

class IntroPageController extends GetxController {
  var pageIndex = 0.obs;
  pageIncreased() => pageIndex++;
  pageDecreased() => pageIndex--;
}
