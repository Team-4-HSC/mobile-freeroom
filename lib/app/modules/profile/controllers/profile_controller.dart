import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeroom/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController  final storage = new FlutterSecureStorage();

  final storage = new FlutterSecureStorage();
  RxString nameUser = 'Loading'.obs;
  RxString typeOfUser = 'Loading'.obs;
  RxString majorUser = 'Loading'.obs;
  RxString facultyUser = 'Loading'.obs;

  var auth = FirebaseAuth.instance;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    String? name = await storage.read(key: 'name');
    String? typeOf = await storage.read(key: 'typeOfUser');
    String? major = await storage.read(key: 'major');
    String? faculty = await storage.read(key: 'faculty');
    name != null ? nameUser.value = name : null;
    typeOf != null ? typeOfUser.value = typeOf : null;
    major != null ? majorUser.value = major : null;
    faculty != null ? facultyUser.value = faculty : null;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void logout() async {
    await storage.deleteAll();
    await auth.signOut();
    Get.to(LoginView());
  }
}
