import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var selectedIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
