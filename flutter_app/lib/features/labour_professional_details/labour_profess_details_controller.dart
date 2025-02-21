import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabourProfessDetailsController extends GetxController {
  TextEditingController yoexperienceController = TextEditingController();
  var selectedSkillLevel = 'Skilled'.obs; // Default value

  void updateSkillLevel(String value) {
    selectedSkillLevel.value = value;
  }

  var selectedtrade = ''.obs;

  var contractorCompanyName = ''.obs;
}
