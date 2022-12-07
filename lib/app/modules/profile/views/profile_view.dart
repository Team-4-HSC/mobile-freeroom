import 'package:flutter/material.dart';
import 'package:freeroom/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileController profileController = Get.put(ProfileController());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: Get.height / 7,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Color(0xFFFF9F1C),
            ),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Obx(
              () {
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: homeController.nameUser.value + '\n',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF7C7C7C),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: homeController.typeOfUser.value + '\n\n',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: homeController.facultyUser.value,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // <-- Radius
                ),
                primary: Color(0xFF2EC4B6),
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                profileController.logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
