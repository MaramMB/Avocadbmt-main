
class Teacher{
  final String id;
  final String idnum;
  final String Name;
  final String secname;
  final String thirdname;
  final String familyname;
  final String Phone_Num;
  final String accountnum;
  final String gender;
  final String specil;
  final String Society_id;
  final String image;
  const Teacher( {
    required this.id,required this.idnum, required this.secname, required this.thirdname, required this.Phone_Num, required this.accountnum,required this.specil,
    required this.gender,
    required this.Name,
    required  this.Society_id,
    required this.familyname,
    required this.image,
  });
  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json['Id'],
    idnum:json['Id_Num'] ,
    Name: json['Name'],
    secname: json['secname'],
    thirdname:json['thirdname'] ,
    familyname:json['familyname'] ,
    Phone_Num:json['Phone_Num'] ,
    gender: json['gender'],
    accountnum: json['accountnum'],
    specil: json['specialization'],
    Society_id: json['Society_Id'],
    image: json['image'],

  );

}
