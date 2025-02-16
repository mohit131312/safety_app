import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContractorController extends GetxController {
  var selectedContractorgrp = ''.obs; // Observable for Blood Group selection
  final List<String> contractorgrp = [
    'A+',
    'A-',
    'B+',
    'B-',
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
