import 'package:get/get.dart';

class StaffPreviewController extends GetxController {
  var isPersonalDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansion() {
    isPersonalDetailsExpanded.value = !isPersonalDetailsExpanded.value;
  }

  var isProfessionalDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionProfessional() {
    isProfessionalDetailsExpanded.value = !isProfessionalDetailsExpanded.value;
  }

  var isidproofDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionidProof() {
    isidproofDetailsExpanded.value = !isidproofDetailsExpanded.value;
  }

  var isprecautionDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionPrecaution() {
    isprecautionDetailsExpanded.value = !isprecautionDetailsExpanded.value;
  }
}
