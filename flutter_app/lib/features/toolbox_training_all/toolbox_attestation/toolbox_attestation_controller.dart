import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class ToolboxAttestationController extends GetxController {
  final SignatureController signatureattestationController =
      SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  var savedAttestationSignature = Rxn<Uint8List>(); // Observable for signature

  void clearSafetyattestationSignature() {
    signatureattestationController.clear();
    savedAttestationSignature.value = null;
  }

  Future<void> saveSafetyattestationSignature() async {
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
