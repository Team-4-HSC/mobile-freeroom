import 'package:flutter/material.dart';
import 'package:freeroom/app/views/views/rku_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: Get.height / 3.2,
        title: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Muhammad Hafiz',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFF9F1C),
              ),
            ),
            Text(
              "Mahasiswa",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2EC4B6),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFFF9F1C),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                'Jumat, 9/9/2022',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
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
        padding: const EdgeInsets.only(
          top: 40,
          left: 50,
          right: 50,
        ),
        child: Column(
          children: [
            Container(
              height: Get.height / 5,
              decoration: BoxDecoration(
                color: Color(0xFFFF9F1C),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: RoomCard(
                roomImage: 'assets/images/ft-logo.png',
                roomName: 'Fakultas Teknik',
                cardColor: 0xFFFF9F1C,
                title: 'Fakultas',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RoomCard(
              roomImage: 'assets/images/rku-logo.png',
              roomName: 'RKU',
              cardColor: 0xFF2EC4B6,
              title: 'RKU',
            ),
          ],
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final roomName;
  final roomImage;
  final cardColor;
  final title;

  const RoomCard({
    Key? key,
    required this.roomName,
    required this.roomImage,
    required this.cardColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5,
      decoration: BoxDecoration(
        color: Color(cardColor),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            roomImage,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomName,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      primary: Colors.white,
                      onPrimary: Color(0xFF505050),
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Get.to(RkuView(
                        title: title,
                      ));
                    },
                    child: Text('Check'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
