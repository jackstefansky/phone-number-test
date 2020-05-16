class PhoneNumber {
  String clean(String number) {
    String phoneNumber = number;

    phoneNumber = _cleanNumber(phoneNumber);
    phoneNumber = _checkLength(phoneNumber);
    phoneNumber = _checkIfNumbersOnly(phoneNumber);
    phoneNumber = _checkArea(phoneNumber);

    return phoneNumber;
  }

  String _cleanNumber(String number) {
    String phoneNumber = number;
    //I'm not sure why this doesn't work
    //RegExp charsToReplace = RegExp('[ -.()]');
    //phoneNumber = phoneNumber.replaceAll(charsToReplace, '');

    phoneNumber = phoneNumber.replaceAll('.', '');
    phoneNumber = phoneNumber.replaceAll(' ', '');
    phoneNumber = phoneNumber.replaceAll('(', '');
    phoneNumber = phoneNumber.replaceAll(')', '');
    phoneNumber = phoneNumber.replaceAll('-', '');
    phoneNumber = phoneNumber.replaceAll('+', '');

    return phoneNumber;
  }

  String _checkLength(String number) {
    String phoneNumber = number;
    if (phoneNumber.length < 10) {
      throw FormatException("incorrect number of digits");
    } else if (phoneNumber.length > 11) {
      throw FormatException("more than 11 digits");
    } else if (phoneNumber.length == 11) {
      if (!phoneNumber.startsWith('1')) {
        throw FormatException("11 digits must start with 1");
      } else {
        return phoneNumber.substring(1);
      }
    } else {
      return phoneNumber;
    }
  }

  String _checkIfNumbersOnly(String number) {
    String phoneNumber = number;

    if (phoneNumber.contains(
      RegExp(r'[a-zA-Z]'),
    )) throw FormatException("letters not permitted");

    if (phoneNumber.contains(
      RegExp(r'[@:!]'),
    )) throw FormatException("punctuations not permitted");

    return phoneNumber;
  }

  String _checkArea(String number) {
    String phoneNumber = number;

    if (phoneNumber[0] == '0' ||
        phoneNumber[0] == '1' ||
        phoneNumber[3] == '0' ||
        phoneNumber[3] == '1') {
      if (phoneNumber[0] == '0') {
        throw FormatException("area code cannot start with zero");
      }
      if (phoneNumber[0] == '1') {
        throw FormatException("area code cannot start with one");
      }
      if (phoneNumber[3] == '0') {
        throw FormatException("exchange code cannot start with zero");
      } else {
        throw FormatException("exchange code cannot start with one");
      }
    }

    return phoneNumber;
  }
}