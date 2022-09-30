import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  RxBool rememberMe = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login(String email, String password) {}

  @override
  void onClose() {}
  void increment() => count.value++;
}
