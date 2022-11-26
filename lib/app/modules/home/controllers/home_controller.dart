import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freeroom/app/data/sensorData.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final storage = new FlutterSecureStorage();

  RxString nameUser = 'Loading'.obs;
  RxString typeOfUser = 'Loading'.obs;
  RxString majorUser = 'Loading'.obs;
  RxString facultyUser = 'Loading'.obs;
  RxBool classFull = false.obs;

  final time = '00.00'.obs;

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

  setSensorData(data) async {
    classFull.value = data.state;
  }

  var timer;

  startTime(int seconds) {
    const duration = Duration(seconds: 1);
    var remainingTime = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingTime == 0) {
        timer.cancel();
      } else {
        int minutes = remainingTime ~/ 60;
        int seconds = (remainingTime % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingTime--;
      }
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
