import 'package:get/get.dart';

class SelectSafetyAssigneeController extends GetxController {
  var selectedAssignee = <String, bool>{}.obs;
  var addedAssignee = <String, bool>{}.obs; // Store confirmed selections
  var searchInformedAssignee = ''.obs;

  final Map<String, List<Map<String, String>>> selectlistAssignee = {
    'A': [
      {
        'name': 'John Doe',
        'designation': 'Manager',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Alice Brown',
        'designation': 'Designer',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
    'B': [
      {
        'name': 'Brian Adams',
        'designation': 'HR',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Bob Marley',
        'designation': 'Musician',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
  };

  /// Toggle contact selection
  void toggleAssigneeSelection(String contactName) {
    selectedAssignee[contactName] = !(selectedAssignee[contactName] ?? false);
  }

  /// Confirm selections by adding them to `addedContacts`
  void confirmSelectionAssignee() {
    addedAssignee.clear();
    addedAssignee.addAll(selectedAssignee);
  }

  /// Remove a contact from added list
  void removeAddedAssignee(String contactName) {
    addedAssignee.remove(contactName);
    selectedAssignee[contactName] = false;
  }

  /// Filter contacts based on search query
  List<Map<String, String>> getFilteredAssignee() {
    if (searchInformedAssignee.value.isEmpty) {
      return selectlistAssignee.values.expand((list) => list).toList();
    }
    return selectlistAssignee.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchInformedAssignee.value.toLowerCase());
    }).toList();
  }

  /// Group contacts by their first letter
  Map<String, List<Map<String, String>>> getGroupedAssignee() {
    Map<String, List<Map<String, String>>> groupedContacts = {};

    for (var entry in selectlistAssignee.entries) {
      String letter = entry.key;
      List<Map<String, String>> contactList = entry.value;

      List<Map<String, String>> filteredContacts = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchInformedAssignee.value.toLowerCase());
      }).toList();

      if (filteredContacts.isNotEmpty) {
        groupedContacts[letter] = filteredContacts;
      }
    }

    return groupedContacts;
  }
}
