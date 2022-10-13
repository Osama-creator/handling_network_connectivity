import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handling_network_connectivity/app/helper/auth_maneger.dart';
import 'package:handling_network_connectivity/app/views/onBoard.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return OnBoard();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
