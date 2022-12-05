enum AccountType { student, teacher, manager }

enum Gender { male, female }

class Person {
  String name, id, address, phoneNumber;
  String? date, managerName, fatherName, fatherjob, motherName, email, password;
  AccountType type;
  Gender gender;
  Person({
    required this.name,
    required this.id,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.type,
    this.date,
    this.managerName,
    this.motherName,
    this.fatherjob,
    this.fatherName,
    this.email,
    this.password,
  });
}
