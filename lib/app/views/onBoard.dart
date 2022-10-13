import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling_network_connectivity/app/helper/auth_maneger.dart';
import 'package:handling_network_connectivity/app/modules/home/views/home_view.dart';
import 'package:handling_network_connectivity/app/modules/login/views/login_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? HomeView() : LoginView();
    });
  }
}
