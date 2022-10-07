import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('Logout'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ),
    );
  }
}