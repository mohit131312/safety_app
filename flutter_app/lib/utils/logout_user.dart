import 'dart:developer';

import 'package:flutter_app/features/login/login_screen.dart';
import 'package:flutter_app/utils/api_client.dart';
import 'package:get/get.dart';

String baseUrl = "http://192.168.1.72/Kumar/KumarProperties/storage/app/";

bool logStatus = true;
void logout() {
  print("Before ${ApiClient.gs.read("login")}");
  ApiClient.gs.write('token', "");
  ApiClient.gs.write('login', false);
  ApiClient.gs.remove('SelectRoleMap');
  logStatus = false;

  log("token is ${ApiClient.gs.read('token')}");
  log("login is ${ApiClient.gs.read('login')}");
  Get.offAll(() => LoginScreen());
}
