import 'package:get/get.dart';

class SelectInvolvedPersonController extends GetxController {
  var selectedPersons = <String, bool>{}.obs;
  var addedPersons = <String, bool>{}.obs; // Store confirmed selections
  var searchPersonsQuery = ''.obs;

  final Map<String, List<Map<String, String>>> selectInvoledPersons = {
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
  void togglePersonsSelection(String contactName) {
    selectedPersons[contactName] = !(selectedPersons[contactName] ?? false);
  }

  /// Confirm selections by adding them to `addedContacts`
  void confirmSelectionPersons() {
    addedPersons.clear();
    addedPersons.addAll(selectedPersons);
  }

  /// Remove a contact from added list
  void removeAddedPersons(String contactName) {
    addedPersons.remove(contactName);
    selectedPersons[contactName] = false;
  }

  /// Filter contacts based on search query
  List<Map<String, String>> getFilteredPersons() {
    if (searchPersonsQuery.value.isEmpty) {
      return selectInvoledPersons.values.expand((list) => list).toList();
    }
    return selectInvoledPersons.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchPersonsQuery.value.toLowerCase());
    }).toList();
  }

  /// Group contacts by their first letter
  Map<String, List<Map<String, String>>> getGroupedPersons() {
    Map<String, List<Map<String, String>>> groupedContacts = {};

    for (var entry in selectInvoledPersons.entries) {
      String letter = entry.key;
      List<Map<String, String>> contactList = entry.value;

      List<Map<String, String>> filteredContacts = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchPersonsQuery.value.toLowerCase());
      }).toList();

      if (filteredContacts.isNotEmpty) {
        groupedContacts[letter] = filteredContacts;
      }
    }

    return groupedContacts;
  }
}
