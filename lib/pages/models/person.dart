enum AccountType { student, teacher, manager }

enum Gender { male, female }

class Person {
  String name, id, address, phoneNumber, familyname, image;
  String? date,
      managerName,
      fatherName,
      grandName,
      fatherjob,
      motherName,
      email,
      teatcherId,
      fatherDob,
      ptype,
      specific,
      accountNumber,
      password;
  AccountType type;
  Gender gender;
  Person(
      {required this.name,
      required this.id,
      required this.gender,
      required this.address,
      required this.phoneNumber,
      required this.type,
      required this.familyname,
      required this.image,
      this.date,
      this.managerName,
      this.motherName,
      this.fatherjob,
      this.fatherName,
      this.email,
      this.password,
      this.grandName,
      this.fatherDob,
      this.teatcherId,
      this.specific,
      this.accountNumber,
      this.ptype});
}
