// import 'package:auth_manager/core/cache_manager.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:handling_network_connectivity/app/helper/cash_maneger.dart';

class AuthenticationManager extends GetxController with CachManeger {
  final isLogged = false.obs;
  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void logOut() async {
    isLogged.value = false;
    await removeToken();
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
