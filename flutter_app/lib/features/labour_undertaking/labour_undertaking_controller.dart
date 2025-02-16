import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class LabourUndertakingController extends GetxController {
  RxBool isCheckedUndertaking = false.obs;
  var searchQueryUndertaking = ''.obs;
  var filteredDetailsUndertaking = [].obs;
  final TextEditingController searchControllerUndertaking =
      TextEditingController();
  var isChecked = false.obs; // Observable variable

  void toggleCheckbox() {
    isChecked.value = !isChecked.value; // Toggle value
  }

  @override
  void onInit() {
    super.onInit();
    filteredDetailsUndertaking.assignAll(checklistUndertaking);
  }

  var checklistUndertaking = [
    {
      'title': 'I understood and will follow all the instructions given to me.',
      'isChecked': false
    },
    {
      'title':
          'I accept all the company regulations explained to me and I will comply to those. ',
      'isChecked': false
    },
    {
      'title':
          'I hereby declare that the information documents provided in above form is true & correct to the best of my knowledge and belief and nothing has been falsely stated. In case any of the above information is found to be false or untrue or misleading or misreprese-nting, I am aware that may be held liable for it.',
      'isChecked': false
    },
  ];

  void toggleCheckboxUndertaking(int index) {
    filteredDetailsUndertaking[index]['isChecked'] =
        !filteredDetailsUndertaking[index]['isChecked'];
    filteredDetailsUndertaking.refresh();
  }

  void toggleSelectAllUndertaking() {
    bool newValue = !isCheckedUndertaking.value;
    isCheckedUndertaking.value = newValue;

    for (var item in filteredDetailsUndertaking) {
      item['isChecked'] = newValue;
    }
    filteredDetailsUndertaking.refresh();
  }

  // void updateSelectAllCheckbox() {
  //   bool allChecked =
  //       filteredDetailsEquipment.every((item) => item['isChecked'] == true);
  //   isCheckedEquipment.value = allChecked;
  // }

  void searchDataUndertaking(String query) {
    searchQueryUndertaking.value = query;
    if (query.isEmpty) {
      filteredDetailsUndertaking.assignAll(checklistUndertaking);
    } else {
      filteredDetailsUndertaking.assignAll(
        filteredDetailsUndertaking
            .where((item) => item['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    signatureController.dispose();
    super.dispose();
  }

  void clearSignature() {
    signatureController.clear();
  }

  Future<void> saveSignature() async {
    try {
      Uint8List? signatureBytes = await signatureController.toPngBytes();

      String base64Signature = base64Encode(signatureBytes!);
      print("Encoded Signature: $base64Signature");
    } catch (e) {
      print("Error uploading signature: $e");
    }
  }
}
