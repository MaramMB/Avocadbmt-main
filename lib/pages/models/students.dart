class Students{
    final String id;
   final String fname;
   final String sname;
   final String tname;
   final String lname;
   final String stdId;
   final String socId;
   final String phone;
   final String dob;
   final String gender;
   final String address;
   final String tid;
   final String problem;
   final String image;
    final String email;
const Students( {
  required this.id,required this.sname, required this.tname, required this.lname, required this.stdId, required this.socId,required  this.phone,required this.dob,
  required this.gender, required this.address, required  this.tid,
required this.fname,
required this.problem,
required this.image,
  required this.email,
});
   factory Students.fromJson(Map<String, dynamic> json) => Students(
     id: json['Id'],
     socId:json['socid'] ,
     sname: json['secname'],
     tname:json['thirdname'] ,
     lname:json['familyname'] ,
     stdId:json['Students_Id'] ,
     phone:json['phone'] ,
     dob: json['DOB'],
     address: json['Address'],
     gender: json['Gender'],
     tid: json['tid'],
     fname: json['firstname'],
     problem: json['ptype'],
     image: json['image'],
     email:json['Email'],

   );

}
