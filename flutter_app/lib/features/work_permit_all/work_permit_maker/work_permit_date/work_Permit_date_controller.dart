import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkPermitDateController extends GetxController {
  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;
  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;

  // Function to update start time from TimeOfDay
  void updateStartTime(TimeOfDay newTime) {
    selectedStartTime.value = newTime;
  }

  // Function to update end time from TimeOfDay
  void updateEndTime(TimeOfDay newTime) {
    selectedEndTime.value = newTime;
  }

  // Function to pick start date
  Future<void> pickStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedStartDate.value) {
      selectedStartDate.value = picked;
    }
  }

  // Function to pick end date
  Future<void> pickEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedEndDate.value) {
      selectedEndDate.value = picked;
    }
  }
}
