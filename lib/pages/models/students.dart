class Students{
   final String name;
   final String problem;
   final String image;
const Students({
required this.name,
required this.problem,
required this.image,
});
   factory Students.fromJson(Map<String, dynamic> json) => Students(
     name: json['name'],
     problem: json['ptype'],
     image: json['image'],

   );

   Map<String, dynamic> toJson() => {
     'name': name,
     'ptype': problem,
     'image': image,

   };
}
