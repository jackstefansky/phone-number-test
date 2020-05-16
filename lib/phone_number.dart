class PhoneNumber {
  
  String clean(String n) {
    String phoneNumber = n;

    phoneNumber = phoneNumber.replaceAll('(', '');
    phoneNumber = phoneNumber.replaceAll(')', '');
    phoneNumber = phoneNumber.replaceAll('.', '');
    phoneNumber = phoneNumber.replaceAll('-', '');
    phoneNumber = phoneNumber.replaceAll(' ', '');

    if (phoneNumber.startsWith('+1')) {
      phoneNumber = phoneNumber.substring(2);
    } else if (phoneNumber.startsWith('1')) {
      phoneNumber = phoneNumber.substring(1);
    }

    return phoneNumber;
  }
}
