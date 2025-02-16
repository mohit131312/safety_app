import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ContractorDetailsController extends GetxController {
  var labourAdharcard = <XFile>[];

  var adharImageCount = 0.obs;

  final maxPhotos = 1;

  Future<void> pickadharImages() async {
    final ImagePicker picker = ImagePicker();

    if (labourAdharcard.length < maxPhotos) {
      int remainingSlots = maxPhotos - labourAdharcard.length;

      final List<XFile> pickedFiles = await picker.pickMultiImage();

      final List<XFile> limitedFiles =
          pickedFiles.take(remainingSlots).toList();

      labourAdharcard.addAll(limitedFiles);
      adharImageCount.value = labourAdharcard.length; // ✅ Correct update

      log('-----------adharImageCount------------$adharImageCount');
      log('-----------labourAdharcard-------------${labourAdharcard.length}');
    }
  }

  void removeAdharImage(int index) {
    if (index >= 0 && index < labourAdharcard.length) {
      labourAdharcard.removeAt(index);
      adharImageCount.value = labourAdharcard.length;

      log('Removed image at index $index from AdharCard. Remaining: ${adharImageCount.value}');
    }
  }

  ////////////
  ///
  TextEditingController nameController = TextEditingController();
  TextEditingController contactnoController = TextEditingController();
  TextEditingController secondarynameController = TextEditingController();
  TextEditingController secondarycontactController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController idproofController = TextEditingController();

  var selectedidProoftype = ''.obs; // Observable for Blood Group selection
  final List<String> idprooftype = [
    'A+',
    'A-',
    'B+',
    'B-',
  ];
}
