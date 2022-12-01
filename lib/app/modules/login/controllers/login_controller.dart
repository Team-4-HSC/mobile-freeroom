import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeroom/app/data/userModel.dart';
import 'package:freeroom/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final storage = new FlutterSecureStorage();

  static LoginController instance = Get.find();
  late Rx<User?> firebaseUser;
  var auth = FirebaseAuth.instance;

  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  late TextEditingController npm = TextEditingController();
  late TextEditingController password = TextEditingController();

  HomeController homeController = Get.put(HomeController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
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
            UserData user = userDataFromJson(response.body);
            await storage.write(key: 'name', value: user.name);
            await storage.write(key: 'typeOfUser', value: user.typeOfUser);
            await storage.write(key: 'faculty', value: user.faculty);
            await storage.write(key: 'major', value: user.major);
            await auth.signInWithEmailAndPassword(
              email: '${npm.text.trim()}@gmail.com',
              password: password.text,
            );
            homeController.nameUser.value = user.name;
            homeController.typeOfUser.value = user.typeOfUser;
            homeController.facultyUser.value = user.faculty;
            homeController.majorUser.value = user.major;
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
