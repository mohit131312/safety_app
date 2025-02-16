import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class IncidentAttestationController extends GetxController {
  TextEditingController rootcauseController = TextEditingController();

  RxBool isCheckedMeasures = false.obs;
  var searchQueryMeasures = ''.obs;
  var filteredDetailsMeasures = [].obs;
  final TextEditingController searchMeasuresController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    filteredDetailsMeasures.assignAll(checklistMeasures);
  }

  List<Map<String, dynamic>> getSelectedMeasures() {
    return List<Map<String, dynamic>>.from(
      filteredDetailsMeasures.where((item) => item['isChecked'] == true),
    );
  }

  var checklistMeasures = [
    {'title': 'Engagement of untrained workers', 'isChecked': false},
    {'title': 'Improper Stacking', 'isChecked': false},
    {'title': 'Face Shield', 'isChecked': false},
    {'title': 'Awkward Posture', 'isChecked': false},
  ];

  void toggleCheckboxMeasures(int index) {
    filteredDetailsMeasures[index]['isChecked'] =
        !filteredDetailsMeasures[index]['isChecked'];
    filteredDetailsMeasures.refresh();
  }

  void toggleSelectAllMeasures() {
    bool newValue = !isCheckedMeasures.value;
    isCheckedMeasures.value = newValue;

    for (var item in filteredDetailsMeasures) {
      item['isChecked'] = newValue;
    }
    filteredDetailsMeasures.refresh();
  }

  void searchDataMeasures(String query) {
    searchQueryMeasures.value = query;
    if (query.isEmpty) {
      filteredDetailsMeasures.assignAll(checklistMeasures);
    } else {
      filteredDetailsMeasures.assignAll(
        filteredDetailsMeasures
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  final SignatureController signatureattestationController =
      SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  var savedAttestationSignature = Rxn<Uint8List>(); // Observable for signature

  void clearattestationSignature() {
    signatureattestationController.clear();
    savedAttestationSignature.value = null;
  }

  Future<void> saveattestationSignature() async {
    try {
      Uint8List? signatureBytes =
          await signatureattestationController.toPngBytes();

      String base64Signature = base64Encode(signatureBytes!);
      savedAttestationSignature.value = signatureBytes;
      print("Encoded Signature: $base64Signature");
    } catch (e) {
      print("Error uploading signature: $e");
    }
  }
}
