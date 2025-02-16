import 'package:get/get.dart';

class IncedentReportPreviewController extends GetxController {
  var isincidentdetailsDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionIncedenet() {
    isincidentdetailsDetailsExpanded.value =
        !isincidentdetailsDetailsExpanded.value;
  }

  var isinvolvepeople = true.obs; // Observable to track expansion state

  void toggleExpansionpeople() {
    isinvolvepeople.value = !isinvolvepeople.value;
  }

  var isprecautionDetailsExpanded =
      true.obs; // Observable to track expansion state

  void toggleExpansionPrecaution() {
    isprecautionDetailsExpanded.value = !isprecautionDetailsExpanded.value;
  }
}
