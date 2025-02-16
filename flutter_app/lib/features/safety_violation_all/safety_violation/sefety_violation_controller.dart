import 'package:get/get.dart';

class SefetyViolationController extends GetxController {
  var selectedOption = 1.obs; // To track selected filter option
  var searchQueryIncident = ''.obs;
  var incidentDetails = <Map<String, dynamic>>[].obs;
  var incidentfilteredDetails = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    incidentDetails.value = incidentDetailData;
    incidentfilteredDetails.value = incidentDetailData;
  }

  final List<Map<String, dynamic>> incidentDetailData = [
    {
      'text2': "Critical",
      'title': "Safety Violation ID",
      "subtitle": "Safety detail",
      "text": "Open",
      'date': 'Creation Date',
    },
    {
      'text2': "Critical",
      'title': "Safety Violation ID",
      "subtitle": "Safety detail",
      "text": "Open",
      'date': 'Creation Date',
    },
    {
      'text2': "Critical",
      'title': "Safety Violation ID",
      "subtitle": "Safety detail",
      "text": "Open",
      'date': 'Creation Date',
    },
    {
      'text2': "Critical",
      'title': "Safety Violation ID",
      "subtitle": "Safety detail",
      "text": "Open",
      'date': 'Creation Date',
    },
    {
      'text2': "Critical",
      'title': "Safety Violation ID",
      "subtitle": "Safety detail",
      "text": "Open",
      'date': 'Creation Date',
    },
  ];

  void changeSelection(int index) {
    selectedOption.value = index;
    applyFilters();
  }

  void searchLabor(String query) {
    searchQueryIncident.value = query;
    applyFilters();
  }

  /// **Apply both search and selection filters**
  void applyFilters() {
    List<Map<String, dynamic>> filtered = List.from(incidentDetails);

    // **Search Filter**
    if (searchQueryIncident.value.isNotEmpty) {
      filtered = filtered
          .where((item) => item['title']!
              .toLowerCase()
              .contains(searchQueryIncident.value.toLowerCase()))
          .toList();
    }

    // **Status Filter**
    if (selectedOption.value == 1) {
      filtered = filtered.where((item) => item['text'] == "Open").toList();
    } else if (selectedOption.value == 2) {
      filtered = filtered.where((item) => item['text'] == "Closed").toList();
    } else if (selectedOption.value == 3) {
      filtered = filtered.where((item) => item['text'] == "Accepted").toList();
    }

    // **Update filtered list**
    incidentfilteredDetails.value = filtered;
  }
}
