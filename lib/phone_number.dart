class PhoneNumber {
  RegExp _nonNumbersChars = RegExp(r'(\D)');
  RegExp _punctuation = RegExp(r'([,\/#!$%\^&\*;:{}=\_`~])');
  RegExp _letters = RegExp(r'([A-Za-z])');

  String clean(String phoneNumber) {
    _checkIfCorrect(phoneNumber);
    String cleanedNumber = phoneNumber.replaceAll(_nonNumbersChars, "");
    _checkIfProperLength(cleanedNumber);

    if (cleanedNumber.length == 11) {
      if (cleanedNumber[0] != '1')
        throw FormatException('11 digits must start with 1');
      else
        cleanedNumber = cleanedNumber.substring(1);
    }

    _checkAreaAndExchangeCode(cleanedNumber);
    return cleanedNumber;
  }

  void _checkIfProperLength(String phoneNumber) {
    if (phoneNumber.length < 10)
      throw FormatException('incorrect number of digits');
    if (phoneNumber.length > 11) throw FormatException('more than 11 digits');
  }

  void _checkIfCorrect(String number) {
    if (_punctuation.hasMatch(number))
      throw new FormatException('punctuations not permitted');
    if (_letters.hasMatch(number))
      throw new FormatException('letters not permitted');
  }

  void _checkAreaAndExchangeCode(String number) {
    if (number[0] == '0')
      throw FormatException('area code cannot start with zero');
    if (number[0] == '1')
      throw FormatException('area code cannot start with one');
    if (number[3] == '0')
      throw FormatException('exchange code cannot start with zero');
    if (number[3] == '1')
      throw FormatException('exchange code cannot start with one');
  }
}
