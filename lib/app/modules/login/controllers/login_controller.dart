import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handling_network_connectivity/app/helper/auth_maneger.dart';
import 'package:handling_network_connectivity/app/model/login_req.dart';
import 'package:handling_network_connectivity/app/model/register_req.dart';
import 'package:handling_network_connectivity/app/services/login_service.dart';

import '../views/login_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController emailCtr;
  late TextEditingController passwordCtr;
  FormType formType = FormType.login;

  late final LoginService _loginService;
  late final AuthenticationManager _authenticationManager;
  @override
  void onInit() {
    emailCtr = TextEditingController();
    passwordCtr = TextEditingController();
    _loginService = Get.put(LoginService());
    _authenticationManager = Get.find();
    super.onInit();
  }

  void register() {
    formType = FormType.register;
  }

  void login() {
    formType = FormType.login;
  }

  Future<void> loginUser() async {
    final response = await _loginService.fetchLogin(
        LoginRequestModel(email: emailCtr.text, password: passwordCtr.text));
    if (response != null) {
      _authenticationManager.login(response.token);
    } else {
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser() async {
    final response = await _loginService.fetchRegister(
        RegisterRequestModel(email: emailCtr.text, password: passwordCtr.text));
    if (response != null) {
      _authenticationManager.login(response.token);
    } else {
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
