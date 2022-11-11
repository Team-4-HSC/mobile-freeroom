import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: Get.height / 7,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TextFormField(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black.withOpacity(0.5),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Cari Ruang Kelas',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textInputAction: TextInputAction.next,
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
          'Belum ada ruang kelas',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
