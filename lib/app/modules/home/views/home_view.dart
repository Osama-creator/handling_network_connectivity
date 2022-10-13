import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handling_network_connectivity/app/helper/auth_maneger.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  AuthenticationManager _authManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                _authManager.logOut();
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Text('HOME VIEW'),
      ),
    );
  }
}
