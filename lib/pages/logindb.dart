enum userType { student, teacher ,manager,admin }
class useracc {
  String email, passward;
  userType type;
  useracc({
    required this.email,
    required this.passward,
    required this.type,
  });
}
