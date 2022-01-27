import 'package:get/get.dart';

class GlobalController extends GetxController {

  final pageIndex = 0.obs;

  GlobalController();

  void changePageIndex(int index) {
    pageIndex.value = index != 2 ? index : 0;
  }

  int getPageIndex() {
    return pageIndex.value;
  }

}