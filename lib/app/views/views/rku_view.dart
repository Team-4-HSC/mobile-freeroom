import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freeroom/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../../data/sensorData.dart';

class RkuView extends GetView {
  final title;

  const RkuView({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    DatabaseReference sensorData = FirebaseDatabase(
            databaseURL:
                "https://freeroom-fa4a6-default-rtdb.asia-southeast1.firebasedatabase.app")
        .ref()
        .child('Fakultas Teknik')
        .child('RKTE-1');
    sensorData.onValue.listen((DatabaseEvent event) {
      SensorData data =
          sensorDataFromJson(jsonEncode(event.snapshot.value!).toString());
      WidgetsFlutterBinding.ensureInitialized();
      homeController.setSensorData(data);
    });

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFFFF9F1C),
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          toolbarHeight: Get.height / 7,
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Color(0xFFFF9F1C),
            ),
          ),
          backgroundColor: Color(0xFFCBF3F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.stop_circle_rounded,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Tunggu',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.stop_circle_rounded,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Kosong',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.stop_circle_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Berisi',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      width: Get.width,
                      child: Text(
                        'Gedung A',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (homeController.classIsWaiting.value) {
                            Get.snackbar(
                              'Error',
                              'Kelas telah dibooking',
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.TOP,
                              titleText: Text(
                                'Error',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              messageText: Text(
                                'Kelas telah dibooking',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else if (homeController.classFull.value) {
                            Get.snackbar(
                              'Error',
                              'Kelas sudah terisi',
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.TOP,
                              titleText: Text(
                                'Error',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              messageText: Text(
                                'Kelas sudah terisi',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Color(0xFFFFBF69),
                                  contentPadding: EdgeInsets.only(
                                    top: 40,
                                    left: 27,
                                    right: 27,
                                  ),
                                  content: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text:
                                          'Apakah anda yakin ingin menggunakan ruang kelas ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'RKTE-1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ini sekarang ?',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actionsAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  actionsPadding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 27,
                                    left: 27,
                                    right: 27,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        primary: Colors.red,
                                      ),
                                      child: Text(
                                        "Batal",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        primary: Color(0xFF00E432),
                                      ),
                                      child: Text(
                                        "Ya",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        homeController
                                            .setIsWaitingAfterWait(true);
                                        if (homeController.timer != null &&
                                            homeController.timer.isActive) {
                                          Get.snackbar(
                                            'Error',
                                            'Kamu telah melakukan booking kelas ini',
                                            backgroundColor: Colors.redAccent,
                                            snackPosition: SnackPosition.TOP,
                                            titleText: Text(
                                              'Error',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            messageText: Text(
                                              'Kamu telah melakukan booking kelas, tunggu hingga jeda waktu selesai jika ingin membooking kelas lain',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        } else {
                                          homeController.time.value = '15:00';
                                          homeController.startTime(
                                              899, context);
                                        }
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              32.0))),
                                              backgroundColor:
                                                  Color(0xFFFFBF69),
                                              content: Obx(
                                                () {
                                                  return RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: 'Berhasil! Kelas ',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'RKTE-1',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' dalam status menunggu\n\n',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'Segara masuk kelas sebelum waktu 15 Menit!\n\n',
                                                          style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.6),
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '${homeController.time.value} Menit',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Obx(
                          () => Container(
                            height: Get.width / 4,
                            width: Get.width / 4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: homeController.classFull.value
                                    ? Colors.red
                                    : homeController.classIsWaiting.value
                                        ? Colors.yellow
                                        : Colors.green,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'RKTE 1',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF545454),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: Get.width / 4,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'RKTE 2',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF545454),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: Get.width / 4,
                          width: Get.width / 4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'RKTE 3',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF545454),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
