import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freeroom/app/modules/dashboard/views/dashboard_view.dart';
import 'package:freeroom/app/modules/login/views/login_view.dart';
import 'package:freeroom/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  static LoginController instance = Get.find();
  late Rx<User?> firebaseUser;
  var auth = FirebaseAuth.instance;

  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  late TextEditingController npm = TextEditingController();
  late TextEditingController password = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => LoginView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => DashboardView());
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    if (isLoading.isTrue) {
      await http
          .get(Uri.parse(
              'https://www.freeroom.app/.netlify/functions/simEndpoint?npm=${npm.text.trim()}&password=${password.text}'))
          .then((response) async {
        if (response.statusCode != 200) {
          Get.snackbar(
            'Login Error',
            'error',
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.TOP,
            titleText: Text(
              'Gagal Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            messageText: Text(
              'NPM atau Password salah atau server error coba beberapa saat lagi',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        } else {
          try {
            await auth.signInWithEmailAndPassword(
              email: '${npm.text.trim()}@gmail.com',
              password: password.text,
            );
          } on FirebaseAuthException catch (e) {
            if (e.message ==
                'There is no user record corresponding to this identifier. The user may have been deleted.') {
              try {
                await auth.createUserWithEmailAndPassword(
                  email: '${npm.text.trim()}@gmail.com',
                  password: password.text,
                );
              } on FirebaseAuthException catch (e) {
                Get.snackbar(
                  'Gagal Login',
                  'Firebase Register Error',
                  backgroundColor: Colors.redAccent,
                  snackPosition: SnackPosition.TOP,
                  titleText: Text(
                    'Gagal Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  messageText: Text(
                    e.message.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }
            }
            Get.snackbar(
              'Gagal Login',
              'Firebase Login Error',
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.TOP,
              titleText: Text(
                'Gagal Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              messageText: Text(
                e.message.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error);
      });
      isLoading.value = false;
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
