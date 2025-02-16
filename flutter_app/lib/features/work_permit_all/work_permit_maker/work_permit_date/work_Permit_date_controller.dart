import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkPermitDateController extends GetxController {
  var selectedDate = DateTime.now().obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
}
