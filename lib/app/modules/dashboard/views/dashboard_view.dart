import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freeroom/app/modules/home/views/home_view.dart';
import 'package:freeroom/app/modules/profile/views/profile_view.dart';
import 'package:freeroom/app/modules/search/views/search_view.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardController dashboardController = Get.put(DashboardController());
  final screen = [
    HomeView(),
    SearchView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: dashboardController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFFCBF3F0),
            selectedItemColor: Color(0xFF2EC4B6),
            unselectedItemColor: Color(0xFFFF9F1C),
            selectedLabelStyle: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 11,
            ),
            iconSize: 28,
            showSelectedLabels: true,
            onTap: (index) {
              dashboardController.changeIndex(index);
            },
            currentIndex: dashboardController.selectedIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Cari',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
