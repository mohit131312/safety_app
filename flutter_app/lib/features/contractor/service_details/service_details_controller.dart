import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  var selectedactivity = ''.obs; // Observable for Blood Group selection
  final List<String> activity = [
    'A1',
    'A2',
    'B1',
    'B2',
  ];

  var selectedServiceArea = ''.obs; // Observable for Blood Group selection
  final List<String> serviceArea = [
    'A+',
    'A-',
    'B+',
    'B-',
  ];
  TextEditingController contractorfirmnameController = TextEditingController();
  TextEditingController gstnController = TextEditingController();
}
