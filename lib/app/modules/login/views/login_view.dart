import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: controller.formType == FormType.login
              ? Text('Login')
              : Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: controller.formType == FormType.login
              ? loginForm()
              : registerForm(),
        ),
      );
    });
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: controller.emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: controller.passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        ElevatedButton(
          onPressed: () async {
            if (controller.formKey.currentState?.validate() ?? false) {
              await controller.loginUser();
            }
          },
          child: Text('Login'),
        ),
        TextButton(
          onPressed: () {
            controller.formType = FormType.register;
          },
          child: Text('Does not have an account?'),
        )
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: controller.emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: controller.passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null ||
                    value.isEmpty ||
                    value != controller.passwordCtr.text)
                ? 'Passwords does not match'
                : null;
          },
          decoration: inputDecoration('Retype Password', Icons.lock),
        ),
        ElevatedButton(
          onPressed: () async {
            if (controller.formKey.currentState?.validate() ?? false) {
              await controller.registerUser();
            }
          },
          child: Text('Register'),
        ),
        TextButton(
          onPressed: () {
            controller.formType = FormType.login;
          },
          child: Text('Login'),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
