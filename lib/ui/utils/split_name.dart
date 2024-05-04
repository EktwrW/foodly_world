Map<String, String> splitName(String fullName) {
  List<String> parts = fullName.split(' ');

  if (parts.length == 4) {
    String firstName = parts.sublist(0, 2).join(' ');
    String lastName = parts.sublist(2, 4).join(' ');
    return {'firstName': firstName, 'lastName': lastName};
  }

  if (parts.length >= 2) {
    String firstName = parts.first;
    String lastName = parts.sublist(1).join(' ');
    return {'firstName': firstName, 'lastName': lastName};
  }

  if (parts.length == 1) {
    return {
      'firstName': parts.first,
      'lastName': '',
    };
  }

  return {'firstName': '', 'lastName': ''};
}
