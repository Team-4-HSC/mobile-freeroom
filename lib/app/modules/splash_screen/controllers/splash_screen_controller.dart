import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../login/views/login_view.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  late Rx<User?> firebaseUser;
  var auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  void onReady() {
    super.onReady();
  }

  _setInitialScreen(User? user) async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();

    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => LoginView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => DashboardView());
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
