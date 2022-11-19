enum AccountType { student, teacher }
enum Gender {male, female}
class Person {
  String name, id, address, phoneNumber;
  AccountType type;
  Gender gender;

  Person({
    required this.name,
    required this.id,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.type,
  });
}
