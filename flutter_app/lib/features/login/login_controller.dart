import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/remote_services.dart';
import 'package:flutter_app/utils/api_client.dart';
import 'package:flutter_app/utils/logout_user.dart';
import 'package:flutter_app/utils/validation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../select_role/select_role.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isPasswordVisible = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? usernameValidator(String? value) {
    return Validator.validateEmail(value);
  }

  String? passwordValidator(String? value) {
    return Validator.validatePassword(value);
  }

  Map<String, dynamic> selectRoleMap = {};

  Future login() async {
    try {
      Map<String, dynamic> map = {
        "email": usernameController.text,
        "password": passwordController.text,
        "FCM_token": "fabf21102951024b",
      };

      print("Request body: $map");

      var response = await RemoteServices.postMethod('safety-login', map);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String accessToken = responseData['data']['access_token'];
        ApiClient.gs.write('token', accessToken);
        ApiClient.gs.write('login', true);
        logStatus = true;
        log("token is ${ApiClient.gs.read('token')}");
        log("login is ${ApiClient.gs.read('login')}");

        selectRoleMap = await responseData['data'];
        ApiClient.gs.write('SelectRoleMap', selectRoleMap);

        log('selectRoleMap: ${selectRoleMap.length}');

        if (formKey.currentState?.validate() ?? false) {
          print("Login Success: ${responseData['message']}");

          formKey.currentState?.reset();
          Get.offAll(() => SelectRole());
        } else {
          Get.snackbar('Error', 'Please Enter Valid Email and Password');
        }
      } else {
        print("Login Failed: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
