import 'package:get/get.dart';

class SelectInformedPeopleController extends GetxController {
  var selectedContacts = <String, bool>{}.obs;

  var searchQuery = ''.obs;

  final Map<String, List<Map<String, String>>> contacts = {
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
      {
        'name': 'Alex Smith',
        'designation': 'Developer',
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
      {
        'name': 'Bella Swan',
        'designation': 'Writer',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
    'C': [
      {
        'name': 'Charlie Chaplin',
        'designation': 'Actor',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Chris Evans',
        'designation': 'Actor',
        'img': 'assets/icons/phone_orange.png'
      },
      {
        'name': 'Catherine Tate',
        'designation': 'Comedian',
        'img': 'assets/icons/phone_orange.png'
      },
    ],
  };

  /// Toggle contact selection
  void toggleContactSelection(String contactName) {
    selectedContacts[contactName] = !(selectedContacts[contactName] ?? false);
  }

  /// Filter contacts based on search query
  List<Map<String, String>> getFilteredContacts() {
    if (searchQuery.value.isEmpty) {
      return contacts.values.expand((list) => list).toList();
    }
    return contacts.values.expand((list) => list).where((contact) {
      return contact['name']!
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  Map<String, List<Map<String, String>>> getGroupedContacts() {
    Map<String, List<Map<String, String>>> grouped = {};

    contacts.forEach((letter, contactList) {
      List<Map<String, String>> filteredList = contactList.where((contact) {
        return contact['name']!
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());
      }).toList();

      if (filteredList.isNotEmpty) {
        grouped[letter] = filteredList;
      }
    });

    return grouped;
  }
}
