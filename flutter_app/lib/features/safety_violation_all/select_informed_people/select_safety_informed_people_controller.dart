import 'package:get/get.dart';

class SelectSafetyInformedPeopleController extends GetxController {
  var selectedInformedPeople = <String, bool>{}.obs;
  var addedInformedPeople = <String, bool>{}.obs; // Store confirmed selections
  var searchInformedPeopleQuery = ''.obs;

  final Map<String, List<Map<String, String>>> selectinformedPeople = {
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
  void toggleInformedPeopleSelection(String contactName) {
    selectedInformedPeople[contactName] =
        !(selectedInformedPeople[contactName] ?? false);
  }

  /// Confirm selections by adding them to `addedContacts`
  void confirmSelectionInformedPeople() {
    addedInformedPeople.clear();
    addedInformedPeople.addAll(selectedInformedPeople);
  }

  /// Remove a contact from added list
  void removeAddedInformedPeople(String contactName) {
    addedInformedPeople.remove(contactName);
    selectedInformedPeople[contactName] = false;
  }

  /// Filter contacts based on search query
  List<Map<String, String>> getFilteredInformedPeople() {
    if (searchInformedPeopleQuery.value.isEmpty) {
      return selectinformedPeople.values.expand((list) => list).toList();
    }
    return selectinformedPeople.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchInformedPeopleQuery.value.toLowerCase());
    }).toList();
  }

  /// Group contacts by their first letter
  Map<String, List<Map<String, String>>> getGroupedInformedPeople() {
    Map<String, List<Map<String, String>>> groupedContacts = {};

    for (var entry in selectinformedPeople.entries) {
      String letter = entry.key;
      List<Map<String, String>> contactList = entry.value;

      List<Map<String, String>> filteredContacts = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchInformedPeopleQuery.value.toLowerCase());
      }).toList();

      if (filteredContacts.isNotEmpty) {
        groupedContacts[letter] = filteredContacts;
      }
    }

    return groupedContacts;
  }
}
