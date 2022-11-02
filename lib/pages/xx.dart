import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/firsttestdata.dart';
import 'package:flutter_application_1/pages/testdetail.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class omePage extends StatefulWidget {
  const omePage({Key? key}) : super(key: key);

  @override
  _omePageState createState() => _omePageState();
}

class _omePageState extends State<omePage> {

  static List<String> testword =['أسد','فأر','عصا','بطة','شباك','أرنب'];

  static List<String> url = ['https://th.bing.com/th/id/OIP.iSebuYpfhQG14qgscrlV1QHaIg?w=186&h=213&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    'https://th.bing.com/th/id/R.4d72d9940dc967e6b7a53ab36dfbaf54?rik=Rq3566yQbsJ0%2bg&riu=http%3a%2f%2fsweetclipart.com%2fmultisite%2fsweetclipart%2ffiles%2fmouse_gray.png&ehk=MsRHbLxNwehMkTfFA%2faQ%2fDmSXirq6hn%2bvpIMn5v7IA0%3d&risl=&pid=ImgRaw&r=0',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];

  final List<FirstTest> testdata = List.generate(testword.length, (index) => FirstTest('${testword[index]}', '${url[index]}','${testword[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pass Data from ListView to next Screen'),),
        body: ListView.builder(
            itemCount: testdata.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(testdata[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(testdata[index].ImageUrl),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TestDetail(index: index,testDataModel: testdata,)));
                  },
                ),
              );
            }
        )
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/firsttestdata.dart';
// import 'package:flutter_application_1/pages/testdetail.dart';
// class HomPage extends StatefulWidget {
//   const HomPage({Key? key}) : super(key: key);
//
//   @override
//   _HomPageState createState() => _HomPageState();
// }
//
// class _HomPageState extends State<HomPage> {
//
//   static List<String> fruitname =['أسد','فأر','عصا','بطة','شباك','أرنب'];
//
//   static List<String> url = ['https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
//     'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
//     'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
//     'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
//     'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];
//
//   final List<FruitDataModel> Fruitdata = List.generate(fruitname.length, (index) => FruitDataModel('${fruitname[index]}', '${url[index]}','${fruitname[index]} Description...'));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Pass Data from ListView to next Screen'),),
//         body: ListView.builder(
//             itemCount: Fruitdata.length,
//             itemBuilder: (context,index){
//               return Card(
//                 child: ListTile(
//                   title: Text(Fruitdata[index].name),
//                   leading: SizedBox(
//                     width: 50,
//                     height: 50,
//                     child: Image.network(Fruitdata[index].ImageUrl),
//                   ),
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FruitDetail(index: index,fruitDataModel: Fruitdata,)));
//                   },
//                 ),
//               );
//             }
//         )
//     );
//   }
// }