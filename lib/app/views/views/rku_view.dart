import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RkuView extends GetView {
  final title;

  const RkuView({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text(
          title + ' view is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
