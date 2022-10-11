import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<HomeController>(
            builder: (builder) => Text(
                  (controller.connectionType == 0)
                      ? 'No Internet'
                      : (controller.connectionType == 1)
                          ? 'You are Connected to Wifi'
                          : 'You are Connected to Mobile Internet',
                  style: TextStyle(fontSize: 30),
                )),
      ),
    );
  }
}
