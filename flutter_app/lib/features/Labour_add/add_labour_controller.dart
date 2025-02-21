import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/global_api_call.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddLabourController extends GetxController {
  var selectedGender = 0.obs; // Default to Male
// Focus Nodes
  var fullnameFocusNode = FocusNode();
  var contactFocusNode = FocusNode();
  final List<Map<String, dynamic>> genders = [
    {'label': 'Male', 'icon': 'assets/icons/male.png'},
    {'label': 'Female', 'icon': 'assets/icons/female.png'},
    {'label': 'Other', 'icon': 'assets/icons/star.png'}
  ];

  void selectGender(int index) {
    selectedGender.value = index;
  }

  String get selectedGenderLabel => genders[selectedGender.value]['label']!;
  var selectedImagePath = ''.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      print("No image selected");
    }
  }

  var isSameAsCurrent = false.obs; // Checkbox state

  var selectedBloodGroup = ''.obs;
  var selectedreasons = ''.obs;
  var selectedDistrict = ''.obs;
  var selectedState = ''.obs;
  var selectedPermanantDistrict = ''.obs;
  var selectedPermanantState = ''.obs;

  var selectedDate = Rxn<DateTime>();
  final TextEditingController dateController = TextEditingController();

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
    dateController.text =
        DateFormat("yyyy MMM dd").format(newDate); // Format as YYYY MMM DD
  }

  var isExpanded = false.obs; // Observable boolean
  var isExpanded2 = false.obs; // Observable boolean

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleExpansion2() {
    isExpanded2.value = !isExpanded2.value;
  }

  List<TextEditingController> addressControllers =
      List.generate(4, (index) => TextEditingController());
  List<TextEditingController> permanantAddressController =
      List.generate(4, (index) => TextEditingController());
  @override
  void onClose() {
    for (var controller in addressControllers) {
      controller.dispose();
    }
    for (var controller in permanantAddressController) {
      controller.dispose();
    }
    fullnameFocusNode.dispose();
    contactFocusNode.dispose();
    super.onClose();
  }

  List<String> addressLabels = ["Street Name", "City", "Taluka", "Pincode"];
  List<String> addresspermanantLabels = [
    "Street Name",
    "City",
    "Taluka",
    "Pincode"
  ];

  // Function to return formatted address
  var formattedAddress = "".obs; // Observable for dynamic updates

  void updateFormattedAddress() {
    formattedAddress.value = addressControllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  // Function to return formatted address
  var formattedpermanantaddAddress = "".obs; // Observable for dynamic updates

  void updateFormattedpermenantAddress() {
    formattedpermanantaddAddress.value = permanantAddressController
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty) // Remove empty fields
        .join(" ");
  }

  TextEditingController fullnameController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();
  TextEditingController econtactnumberController = TextEditingController();
  TextEditingController econtactnameController = TextEditingController();
  TextEditingController econtactrelationController = TextEditingController();
  var econtactnumberFocusNode = FocusNode();
  var econtactnameFocusNode = FocusNode();
  var econtactrelationFocusNode = FocusNode();
  var streetFocusNode = FocusNode();
  var cityFocusNode = FocusNode();
  var talukaFocusNode = FocusNode();
  var pincodeFocusNode = FocusNode();
  var streetPermanatFocusNode = FocusNode();
  var cityPermanatFocusNode = FocusNode();
  var talukaPermanatFocusNode = FocusNode();
  var pincodePermanatFocusNode = FocusNode();
  var searchFocusNode = FocusNode();

  void toggleSameAsCurrent(bool value) {
    isSameAsCurrent.value = value;
    if (value) {
      for (int i = 0; i < 4; i++) {
        permanantAddressController[i].text = addressControllers[i].text;
      }
      selectedPermanantState.value = selectedState.value;
      selectedPermanantDistrict.value = selectedDistrict.value;
    } else {
      for (int i = 0; i < 4; i++) {
        permanantAddressController[i].clear();
      }
      selectedPermanantState.value = '';
      selectedPermanantDistrict.value = '';
    }
  }

  //----------------------
  var searchType = 'ID'.obs;
  var userFound = false.obs;
  var selectedLabourData = ''.obs;
  Future getSafetyLabourDetails(String id) async {
    try {
      if (id.isEmpty) {
        print("Error: Labour ID is empty. Cannot fetch data.");
        userFound.value = false;
        clearUserFields();
        return;
      }

      Map<String, dynamic> map = searchType.value == 'ID'
          ? {"labour_id": id, "labour_name": ""}
          : {"labour_id": '', "labour_name": id};
      print("Request body: $map");

      var responseData = await globApiCall('get_safety_labour_details', map);
      log('API Response: ${responseData}');

      //  Handle API failure (null or false status)
      if (responseData == null || responseData['status'] == false) {
        log("API returned an error: ${responseData?['message'] ?? 'Unknown error'}");
        userFound.value = false;
        clearUserFields();
        return;
      }

      var data = await responseData['data'];

      //  Handle empty or missing 'labour' key
      if (data == null ||
          !data.containsKey('labour') ||
          data['labour'].isEmpty) {
        log("No labour data found for ID: $id");
        userFound.value = false;
        clearUserFields();
        return;
      }

      //  User Found: Populate the fields
      var labour = await data['labour'][0];
      selectedLabourData.value = labour['labour_name'] ?? "";
      fullnameController.text = labour['labour_name'] ?? "";
      contactnumberController.text = labour['contact_number'] ?? "";
      selectedBloodGroup.value = labour['blood_group'] ?? "";
      econtactnameController.text = labour['emergency_contact_name'] ?? "";
      econtactnumberController.text = labour['emergency_contact_number'] ?? "";
      econtactrelationController.text =
          labour['emergency_contact_relation'] ?? "";

      // Populate current address
      addressControllers[0].text = labour['current_street_name'] ?? "";
      addressControllers[1].text = labour['current_city'] ?? "";
      addressControllers[2].text = labour['current_taluka'] ?? "";
      addressControllers[3].text = labour['current_pincode'] ?? "";

      selectedState.value = labour['current_state']?.toString() ?? "";
      selectedDistrict.value = labour['current_district']?.toString() ?? "";

      // Populate permanent address
      permanantAddressController[0].text =
          labour['permanent_street_name'] ?? "";
      permanantAddressController[1].text = labour['permanent_city'] ?? "";
      permanantAddressController[2].text = labour['permanent_taluka'] ?? "";
      permanantAddressController[3].text = labour['permanent_pincode'] ?? "";

      selectedPermanantState.value =
          labour['permanent_state']?.toString() ?? "";
      selectedPermanantDistrict.value =
          labour['permanent_district']?.toString() ?? "";

      userFound.value = true;

      print('--- Labour Data ---');
      print('Full Name: ${fullnameController.text}');
      print('Contact Number: ${contactnumberController.text}');
      print('Blood Group: ${selectedBloodGroup.value}');
      print('Emergency Contact Name: ${econtactnameController.text}');
      print('Emergency Contact Number: ${econtactnumberController.text}');
      print('Emergency Contact Relation: ${econtactrelationController.text}');
      searchResults.value = List<Map<String, dynamic>>.from(data['labour']);
    } catch (e) {
      log("Error: $e");
      userFound.value = false;
      clearUserFields();
    }
  }

  Future getSafetyLabourMatchedDetails(String id) async {
    try {
      if (id.isEmpty) {
        clearUserFields();
        print("Error: Labour ID is empty. Cannot fetch data.");
        return;
      }

      Map<String, dynamic> map = {"labour_id": '', "labour_name": id};
      print("Request body: $map");

      var responseData = await globApiCall('get_safety_labour_details', map);
      log('API Response: ${responseData}');

      var data = await responseData['data'];
      if (data == null ||
          !data.containsKey('labour') ||
          data['labour'].isEmpty) {
        log("No matched labour data found for Name: $id");
        searchResults.clear();
        clearUserFields();
        return;
      }

      searchResults.value =
          await List<Map<String, dynamic>>.from(data['labour']);
    } catch (e) {
      log("Error: $e");
      searchResults.clear();
      clearUserFields();
    }
  }

  var searchResults = <Map<String, dynamic>>[].obs;
  Future<void> searchLabour(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      clearUserFields();

      return;
    }
  }

  void clearUserFields() {
    fullnameController.clear();
    contactnumberController.clear();
    econtactnameController.clear();
    econtactrelationController.clear();
    econtactnumberController.clear();

    selectedBloodGroup.value = "";
    selectedState.value = "";
    selectedDistrict.value = "";
    selectedPermanantState.value = "";
    selectedPermanantDistrict.value = "";

    for (var controller in addressControllers) {
      controller.clear();
    }
    for (var controller in permanantAddressController) {
      controller.clear();
    }
  }
}
