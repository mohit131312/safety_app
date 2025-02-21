import 'dart:developer';

import 'package:flutter_app/features/induction_training/induction_training_add_model.dart';
import 'package:flutter_app/features/induction_training/induction_training_model.dart';
import 'package:flutter_app/utils/global_api_call.dart';
import 'package:get/get.dart';

class InductionTrainingController extends GetxController {
  var selectedOption = 0.obs;
  var searchQuery = ''.obs;
  var personalDetails = <Map<String, dynamic>>[].obs;
  var filteredDetails = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    personalDetails.value = personalDetailData;
    filteredDetails.value = personalDetailData;

    super.onInit();
  }

  final List<Map<String, dynamic>> personalDetailData = [
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
    {
      'img': "assets/icons/Profile.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Gov. Official",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/User.png",
      "text": "Client",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Navin Shah",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/users.png",
      "text": "Staff",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/messages.png",
      "text": "Consultant",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Contractor",
    },
    {
      'img': "assets/icons/Profile.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Gov. Official",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/User.png",
      "text": "Client",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
    {
      'img': "assets/icons/profile_icon.png",
      'title': "Labour Name",
      "subtitle": "ID -Created On",
      "icon": "assets/icons/Labours.png",
      "text": "Labour",
    },
  ];

  void changeSelection(int index) {
    selectedOption.value = index;
  }

  void searchLabor(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredDetails.value = personalDetails;
    } else {
      filteredDetails.value = personalDetails
          .where((item) =>
              item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  List<CategoryData> selectCatogery = [];
  Future getProjectDetails() async {
    try {
      Map<String, dynamic> map = {};

      print("Request body: $map");

      var responseData =
          await globApiCall('get_induction_categories_list', map);

      selectCatogery = (responseData['data'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList();
      print('----------selectCatogery$selectCatogery');
      log('----------selectCatogery${selectCatogery.length}');
    } catch (e) {
      print("Error: $e");
    }
  }

  // Map<String, dynamic> bloodGrpTypes = {};
  // List<InductionTrainingAdd> selectInductionData = [];
  // List<IdProofList> idProofList = [];
  // List<IdProofList> reasonForVisitList = [];'

  List<BloodType> bloodGrpTypes = [];
  List<InductionTrainingAdd> selectInductionData = [];
  List<IdProofList> idProofList = [];
  var selectedreasons = ''.obs;
  List<IdProofList> reasonForVisitList = [];
  List<InstructionsListElement> tradeList = [];
  List<IdProofList> safetyEquipmentList = [];
  List<InstructionsListElement> instructionsList = [];
  List<ContractorList> contractorLists = [];
  List<StateList> stateList = [];
  List<DistrictList> districtList = [];

  Future getInductionTrainingAdd(int userType) async {
    try {
      Map<String, dynamic> map = {"user_type": userType};

      print("Request body: $map");

      var responseData = await globApiCall('get_induction_training_add', map);
      var data = responseData['data'];

      bloodGrpTypes = (data['bloodTypes'] as List<dynamic>)
          .map((e) => BloodType.fromJson(e as Map<String, dynamic>))
          .toList();
      print('----------bloodGrpTypes$bloodGrpTypes');
      //-------------------------------------------------

      idProofList = (data['id_proof_list'] as List<dynamic>)
          .map((e) => IdProofList.fromJson(e as Map<String, dynamic>))
          .toList();
      //-------------------------------------------------

      reasonForVisitList = (data['reason_of_visit'] as List<dynamic>)
          .map((e) => IdProofList.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------reasonForVisitList$reasonForVisitList');

      //-------------------------------------------------

      safetyEquipmentList = (data['safety_equipment_list'] as List<dynamic>)
          .map((e) => IdProofList.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------safetyEquipmentList$safetyEquipmentList');

      //-------------------------------------------------

      tradeList = (data['trade_list'] as List<dynamic>)
          .map((e) =>
              InstructionsListElement.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------tradeList$tradeList');

      //-------------------------------------------------
      instructionsList = (data['instructions_list'] as List<dynamic>)
          .map((e) =>
              InstructionsListElement.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------instructionsList$instructionsList');

      //-------------------------------------------------

      contractorLists = (data['contractor_lists'] as List<dynamic>)
          .map((e) => ContractorList.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------contractorLists$contractorLists');

      //-------------------------------------------------
      stateList = (data['state_list'] as List<dynamic>)
          .map((e) => StateList.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------stateList$stateList');

      //-------------------------------------------------
      districtList = (data['district_list'] as List<dynamic>)
          .map((e) => DistrictList.fromJson(e as Map<String, dynamic>))
          .toList();

      print('----------districtList$districtList');
      //-----------------------------------------------------

      log('----------bloodGrpTypes${bloodGrpTypes.length}');
      log('----------reasonForVisitList${reasonForVisitList.length}');
      log('----------safetyEquipmentList${safetyEquipmentList.length}');
      log('----------tradeList${tradeList.length}');
      log('----------instructionsList${instructionsList.length}');
      log('----------contractorLists${contractorLists.length}');
      log('----------stateList${stateList.length}');
      log('----------districtList${districtList.length}');
      //-------------------------------------------------
    } catch (e) {
      print("Error: $e");
    }
  }
}
