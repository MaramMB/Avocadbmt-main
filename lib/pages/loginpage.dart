<<<<<<< Updated upstream
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Profile/profile.dart';
import 'package:flutter_application_1/pages/manag.dart';
import 'package:flutter_application_1/pages/request.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:http/http.dart' as http;
class logintest extends StatefulWidget {
  @override
  _logintestState createState() => _logintestState();
}

class _logintestState extends State<logintest> {
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
   login()async {
     const url="http://localhost/log.php";

     final response =await http.post(Uri.parse(url),body:{
       "Email":email.text,
       "pass":pass.text,
     });
     if (response.statusCode == 200) {
       var user = json.decode(response.body);
       print(user);
       if (user == "Error") {
         showDialog(
           context: (context),
           builder: (context) => AlertDialog(
             content: Text('Invalid Username and password'),
             actions: <Widget>[
               ElevatedButton(
                 // : Colors.red,
                 child: Text('Cancel'),
                 onPressed: () {
                   Navigator.pop(context);
                 },
               )
             ],
           ),
         );
         print("Username & Password Invalid");
       } else {
         if(user['active'] == 'active') {
           if (user['Kind'] == 'manager') {
             Navigator.push(context,
               MaterialPageRoute(builder: (context) => adminmanage(),),);
             print(user['Kind']);
             print(user['active']);
           } else if (user['Kind'] == 'admin') {
             Navigator.push(
               context, MaterialPageRoute(builder: (context) => personal(),),);
             print(user['Kind']);
           } else if (user['Kind'] == 'student') {
             Navigator.push(
               context, MaterialPageRoute(builder: (context) => mainpage(),),);
             print(user['Kind']);
           } else {
             Navigator.push(
               context, MaterialPageRoute(builder: (context) => mainpage(),),);
             print(user['Kind']);
           }
         }
         else{
           showDialog(
             context: (context),
             builder: (context) => AlertDialog(
               content: Text('your account is not active'),
               actions: <Widget>[
                 ElevatedButton(
                   // : Colors.red,
                   child: Text('Cancel'),
                   onPressed: () {
                     Navigator.pop(context);
                   },
                 )
               ],
             ),
           );
         }

       }
       setState(() {});
     }

  }
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  late String _email,_pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Demo Login Page"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              // validator: (val) => !val!.contains("@") ? "Email Id is not Valid" : null ,
              onSaved: (val) => _email = val!,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email"
              ),
            ),
            TextFormField(
              controller: pass,
              onSaved: (val) => _pass = val!,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password"
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () async{
                 await login();
                  // if(formKey.currentState!.validate()) {
                  //   formKey.currentState?.save();
                  //
                  //   _showSnackbar();
                  // }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
=======
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
>>>>>>> Stashed changes
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
//
// import 'mainpage.dart';
// //import http package manually
//
// class LoginPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return _LoginPage();
//   }
// }
//
// class _LoginPage extends State<LoginPage>{
//   late String errormsg;
//    late bool error, showprogress;
//   late String username, password;
//
//   final _username = TextEditingController();
//   final _password = TextEditingController();
//
//   startLogin() async {
//     String apiurl = "http://192.168.1.1/avocadbmt/login.php"; //api url
//     print(username);
//
//     var response = await http.post(Uri.parse(apiurl), body: {
//       'username': username, //get the username text
//       'password': password  //get password text
//     });
//
//     if(response.statusCode == 200){
//       var jsondata = json.decode(response.body);
//       if(jsondata["error"]){
//         setState(() {
//           showprogress = false; //don't show progress indicator
//           error = true;
//           errormsg = jsondata["message"];
//         });
//       }else{
//         if(jsondata["success"]){
//           setState(() {
//             error = false;
//             showprogress = false;
//           });
//           //save the data returned from server
//           //and navigate to home page
//           // String uid = jsondata["uid"];
//           //user shared preference to save data
//         }else{
//           showprogress = false; //don't show progress indicator
//           error = true;
//           errormsg = "Something went wrong.";
//         }
//       }
//     }else{
//       setState(() {
//         showprogress = false; //don't show progress indicator
//         error = true;
//         errormsg = "Error during connecting to server.";
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     username = "";
//     password = "";
//     errormsg = "";
//     error = false;
//     showprogress = false;
//
//     //_username.text = "defaulttext";
//     //_password.text = "defaultpassword";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent
//       //color set to transperent or set your own color
//     ));
//
//     return Scaffold(
//       body: SingleChildScrollView(
//           child:Container(
//             constraints: BoxConstraints(
//                 minHeight:MediaQuery.of(context).size.height
//               //set minimum height equal to 100% of VH
//             ),
//             width:MediaQuery.of(context).size.width,
//             //make width of outer wrapper to 100%
//             decoration:const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [ Colors.orange,Colors.deepOrangeAccent,
//                   Colors.red, Colors.redAccent,
//                 ],
//               ),
//             ), //show linear gradient background of page
//
//             padding: const EdgeInsets.all(20),
//             child:Column(children:<Widget>[
//
//               Container(
//                 margin: const EdgeInsets.only(top:80),
//                 child: const Text("Sign Into System", style: TextStyle(
//                     color:Colors.white,fontSize: 40, fontWeight: FontWeight.bold
//                 ),), //title text
//               ),
//
//               Container(
//                 margin: const EdgeInsets.only(top:10),
//                 child: const Text("Sign In using Email and Password", style: TextStyle(
//                     color:Colors.white,fontSize: 15
//                 ),), //subtitle text
//               ),
//
//               Container(
//                 //show error message here
//                 margin: const EdgeInsets.only(top:30),
//                 padding: const EdgeInsets.all(10),
//                 child:error? errmsg(errormsg):Container(),
//                 //if error == true then show error message
//                 //else set empty container as child
//               ),
//
//               Container(
//                 padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                 margin: const EdgeInsets.only(top:10),
//                 child: TextField(
//                   controller: _username, //set username controller
//                   style:TextStyle(color:Colors.orange[100], fontSize:20),
//                   decoration: myInputDecoration(
//                     label: "Username",
//                     icon: Icons.person,
//                   ),
//                   onChanged: (value){
//                     //set username  text on change
//                     username = value;
//                   },
//
//                 ),
//               ),
//
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 child: TextField(
//                   controller: _password, //set password controller
//                   style: TextStyle(color:Colors.orange[100], fontSize:20),
//                   obscureText: true,
//                   decoration: myInputDecoration(
//                     label: "Password",
//                     icon: Icons.lock,
//                   ),
//                   onChanged: (value){
//                     // change password text
//                     password = value;
//                   },
//
//                 ),
//               ),
//
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.only(top:20),
//                 child: SizedBox(
//                   height: 60, width: double.infinity,
//                   child:ElevatedButton(
//                     onPressed: (){
//                       setState(() {
//                         //show progress indicator on click
//                         showprogress = true;
//                       });
//                       mainpage();
//                       // startLogin();
//                       // Navigator.of(context)
//                       //     .push(MaterialPageRoute(builder: (context) {
//                       //   return const mainpage();
//                       // })
//                       // );
//
//                     },
//                     child: showprogress?
//                     SizedBox(
//                       height:30, width:30,
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.orange[100],
//                         valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
//                       ),
//                     ):const Text("LOGIN NOW", style: TextStyle(fontSize: 20),),
//                     // if showprogress == true then show progress indicator
//                     // else show "LOGIN NOW" text
//                     // colorBrightness: Brightness.dark,
//                     // color: Colors.orange,
//                     // shape: RoundedRectangleBorder(
//                     //     borderRadius:BorderRadius.circular(30)
//                     //   //button corner radius
//                     // ),
//                   ),
//                 ),
//               ),
//
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.only(top:20),
//                 child: InkResponse(
//                     onTap:(){
//                       //action on tap
//                     },
//                     child:const Text("Forgot Password? Troubleshoot",
//                       style: TextStyle(color:Colors.white, fontSize:18),
//                     )
//                 ),
//               )
//             ]),
//           )
//       ),
//     );
//   }
//
//   InputDecoration myInputDecoration({required String label, required IconData icon}){
//     return InputDecoration(
//       hintText: label, //show label as placeholder
//       hintStyle: TextStyle(color:Colors.orange[100], fontSize:20), //hint text style
//       prefixIcon: Padding(
//           padding: const EdgeInsets.only(left:20, right:10),
//           child:Icon(icon, color: Colors.orange[100],)
//         //padding and icon for prefix
//       ),
//
//       contentPadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color:Colors.orange, width: 1)
//       ), //default border of input
//
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color:Colors.orange, width: 1)
//       ), //focus border
//
//       fillColor: const Color.fromRGBO(251,140,0, 0.5),
//       filled: true, //set true if you want to show input background
//     );
//   }
//
//   Widget errmsg(String text){
//     //error message widget.
//     return Container(
//       padding: const EdgeInsets.all(15.00),
//       margin: const EdgeInsets.only(bottom: 10.00),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.red,
//           border: Border.all(color:Colors.red, width:2)
//       ),
//       child: Row(children: <Widget>[
//         Container(
//           margin: const EdgeInsets.only(right:6.00),
//           child: const Icon(Icons.info, color: Colors.white),
//         ), // icon for error message
//
//         Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
//         //show error message text
//       ]),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/pages/mainpage.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'homepage.dart';
// // class log extends StatefulWidget {
// //   log({Key? key, required this.title}) : super(key: key);
// //   final String title;
// //
// //   @override
// //   _logState createState() => _logState();
// // }
// //
// // class _logState extends State<log> {
// //   //For LinearProgressIndicator.
// //   bool _visible = false;
// //
// //   //Textediting Controller for Username and Password Input
// //   final userController = TextEditingController();
// //   final pwdController = TextEditingController();
// //
// //   Future userLogin() async {
// //     //Login API URL
// //     //use your local IP address instead of localhost or use Web API
// //     String url = "http://127.0.0.1/avocadbmt/login.php";
// //
// //     // Showing LinearProgressIndicator.
// //     setState(() {
// //       _visible = true;
// //     });
// //
// //     // Getting username and password from Controller
// //     var data = {
// //       'username': userController.text,
// //       'password': pwdController.text,
// //     };
// //
// //     //Starting Web API Call.
// //     var response = await http.post(Uri.parse(url), body: json.encode(data));
// //     if (response.statusCode == 200) {
// //       //Server response into variable
// //       print(response.body);
// //       var msg = jsonDecode(response.body);
// //
// //       //Check Login Status
// //       if (msg['loginStatus'] == true) {
// //         setState(() {
// //           //hide progress indicator
// //           _visible = false;
// //         });
// //
// //         // Navigate to Home Screen
// //         Navigator.push(
// //             context, MaterialPageRoute(builder: (context) => HomePage(uname:msg['userInfo']['NAME'])));
// //       } else {
// //         setState(() {
// //           //hide progress indicator
// //           _visible = false;
// //
// //           //Show Error Message Dialog
// //           showMessage(msg["message"]);
// //         });
// //       }
// //     } else {
// //       setState(() {
// //         //hide progress indicator
// //         _visible = false;
// //
// //         //Show Error Message Dialog
// //         showMessage("Error during connecting to Server.");
// //       });
// //     }
// //   }
// //
// //   Future<dynamic> showMessage(String _msg) async {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text(_msg),
// //           actions: <Widget>[
// //             TextButton(
// //               child: const Text("OK"),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   final _formKey = GlobalKey<FormState>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //           body: SingleChildScrollView(
// //             scrollDirection: Axis.vertical,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 Visibility(
// //                   visible: _visible,
// //                   child: Container(
// //                     margin: const EdgeInsets.only(bottom: 10.0),
// //                 //kk
// //                 child: const LinearProgressIndicator(),
// //               ),
// //                 ),
// //                 Container(
// //                   height: 100.0,
// //                 ),
// //                 Icon(
// //                   Icons.group,
// //                   color: Theme.of(context).primaryColor,
// //                   size: 80.0,
// //                 ),
// //                 const SizedBox(
// //                   height: 10.0,
// //                 ),
// //                 Text(
// //                   'Login Here',
// //                   style: TextStyle(
// //                       color: Theme.of(context).primaryColor,
// //                       fontSize: 25.0,
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(
// //                   height: 40.0,
// //                 ),
// //                 Form(
// //                   key: _formKey,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Column(
// //                       children: [
// //                         Theme(
// //                           data: ThemeData(
// //                             primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
// //                             primaryColorDark: const Color.fromRGBO(84, 87, 90, 0.5),
// //                             hintColor:
// //                             const Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
// //                           ),
// //                           child: TextFormField(
// //                             controller: userController,
// //                             decoration: const InputDecoration(
// //                               focusedBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               enabledBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               errorBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.red,
// //                                   width: 1.0,
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               labelText: 'Enter User Name',
// //                               prefixIcon: Icon(
// //                                 Icons.person,
// //                                 color: Color.fromRGBO(84, 87, 90, 0.5),
// //                               ),
// //                               border: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               hintText: 'User Name',
// //                             ),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Please Enter User Name';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 20.0,
// //                         ),
// //                         Theme(
// //                           data: ThemeData(
// //                             primaryColor: const Color.fromRGBO(84, 87, 90, 0.5),
// //                             primaryColorDark: const Color.fromRGBO(84, 87, 90, 0.5),
// //                             hintColor:
// //                             const Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
// //                           ),
// //                           child: TextFormField(
// //                             controller: pwdController,
// //                             obscureText: true,
// //                             decoration: const InputDecoration(
// //                               focusedBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               enabledBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               errorBorder: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Colors.red,
// //                                   width: 1.0,
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               border: OutlineInputBorder(
// //                                 borderSide: BorderSide(
// //                                   color: Color.fromRGBO(84, 87, 90, 0.5),
// //                                   style: BorderStyle.solid,
// //                                 ),
// //                               ),
// //                               labelText: 'Enter Password',
// //                               prefixIcon: Icon(
// //                                 Icons.lock,
// //                                 color: Color.fromRGBO(84, 87, 90, 0.5),
// //                               ),
// //                               hintText: 'Password',
// //                             ),
// //                             validator: (value) {
// //                               if (value == null || value.isEmpty) {
// //                                 return 'Please Enter Password';
// //                               }
// //                               return null;
// //                             },
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           height: 20.0,
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: ElevatedButton(
// //                             onPressed: () => {
// //                               // Validate returns true if the form is valid, or false otherwise.
// //                               if (_formKey.currentState!.validate()) {userLogin()}
// //                             },
// //                             style: ButtonStyle(
// //                               backgroundColor: MaterialStateProperty.all<Color>(
// //                                   Theme.of(context).primaryColor),
// //                             ),
// //                             child: const Padding(
// //                               padding: EdgeInsets.all(16.0),
// //                               child: Text(
// //                                 'Submit',
// //                                 style: TextStyle(fontSize: 18.0),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ));
// //   }
// // }
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_application_1/pages/mainpage.dart';
// // // import 'package:flutter_application_1/pages/signup.dart';
// // //
// // // import 'forgetpass.dart';
// // //
// // // const blak = Color.fromRGBO(55, 53, 53, 1);
// // // const gren = Color.fromRGBO(129, 188, 95, 1);
// // // const backgreen = Color.fromRGBO(131, 190, 99, 1);
// // //
// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<LoginPage> createState() => _LoginPageState();
// // // }
// // //
// // // class _LoginPageState extends State<LoginPage> {
// // //   final TextEditingController emailcontoler = TextEditingController();
// // //   final TextEditingController passcontrol = TextEditingController();
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return  MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: Scaffold(
// // //         backgroundColor: Color.fromRGBO(131, 190, 99, 1),
// // //
// // //         // backgroundColor: Color.fromRGBO(131, 190, 99, 1),
// // //       //   body: Center(
// // //       //     child: Column(
// // //       //       mainAxisAlignment: MainAxisAlignment.center,
// // //       //       children: [
// // //       //         Text("تسجيل الدخول",style: TextStyle( fontFamily: "DroidKufi", fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,)),
// // //       //         SizedBox(height: 20,),
// // //       //         Container(
// // //       //           padding: EdgeInsets.all(25),
// // //       //           width:MediaQuery.of(context).size.width/2,
// // //       //           decoration: const BoxDecoration(
// // //       //             color:  Color.fromRGBO(255, 255, 255, 0.85),
// // //       //             borderRadius: BorderRadius.all(Radius.circular(15),
// // //       //             ),),
// // //       //           child: Row(
// // //       //             children: [
// // //       //               Icon(Icons.email),
// // //       //               // TextFormField(
// // //       //               //   controller: TextEditingController(),
// // //       //               //   decoration:  const InputDecoration(
// // //       //               //     fillColor: Colors.white,
// // //       //               //     border: OutlineInputBorder(
// // //       //               //         borderRadius: BorderRadius.all(Radius.circular(15))
// // //       //               //     ),
// // //       //               //   ),
// // //       //               // ),
// // //       //             ],
// // //       //           ),
// // //       //         ),
// // //       //       ],
// // //       //     ),
// // //       //   ),
// // //       // ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.only(
// // //             top: 100.0, bottom: 120.0, right: 350, left: 350),
// // //           // backgroundColor: Color.fromRGBO(131, 190, 99, 1),
// // //         child: Stack(
// // //
// // //         children: [
// // //             Image.asset(
// // //               'img/boyWave.png',
// // //               fit: BoxFit.fill,
// // //             ),
// // //             Container(
// // //               decoration: BoxDecoration(
// // //                 borderRadius: const BorderRadius.only(
// // //                     topLeft: Radius.circular(35),
// // //                     topRight: Radius.circular(35)),
// // //                 color: Colors.white,
// // //                 border:
// // //                     Border.all(color: gren, style: BorderStyle.solid, width: 5),
// // //               ),
// // //               child: Column(
// // //                 children: <Widget>[
// // //                   const SizedBox(
// // //                     height: 25,
// // //                   ),
// // //                   const Text(
// // //                     "تسجيل الدخول",
// // //                     style: TextStyle(
// // //                         color: Colors.green,
// // //                         fontFamily: "DroidKufi",
// // //                         fontSize: 40,
// // //                         fontWeight: FontWeight.bold),
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 25,
// // //                   ),
// // //                   Row(
// // //                     children: const [
// // //                       Icon(Icons.email),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 25,
// // //                   ),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                     children: const [
// // //                       Icon(Icons.remove_red_eye),
// // //                       // field("كلمة المرور", TextInputType.text, passcontrol),
// // //                       Icon(Icons.lock),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 25,
// // //                   ),
// // //                   TextButton(
// // //                     onPressed: () {
// // //                       Navigator.of(context)
// // //                           .push(MaterialPageRoute(builder: (context) {
// // //                         return const forgetpassw();
// // //                       }));
// // //                     },
// // //                     child: const Text(
// // //                       "هل نسيت كلمة المرور ؟",
// // //                       style: TextStyle(
// // //                           color: Colors.black87, fontFamily: "DroidKufi"),
// // //                       textAlign: TextAlign.right,
// // //                     ),
// // //                   ),
// // //                   const Text(
// // //                     "انساها واحنا مالنا",
// // //                     style: TextStyle(
// // //                         color: Colors.black87, fontFamily: "DroidKufi"),
// // //                     textAlign: TextAlign.right,
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 45,
// // //                   ),
// // //                   RawMaterialButton(
// // //                     elevation: 2.0,
// // //                     fillColor: gren,
// // //                     padding: const EdgeInsets.only(
// // //                         left: 15.0, right: 15.0, bottom: 6.0, top: 4.0),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(10),
// // //                     ),
// // //                     child: const Text("تسجيل الدخول",
// // //                         style: TextStyle(
// // //                           color: Colors.white,
// // //                           fontFamily: "DroidKufi",
// // //                           fontSize: 16.0,
// // //                         )),
// // //                     onPressed: () {
// // //                       Navigator.of(context)
// // //                           .push(MaterialPageRoute(builder: (context) {
// // //                         return const mainpage();
// // //                       })
// // //                       );
// // //                     },
// // //                   ),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     ));
// // //   }
// // //
// // //   field(
// // //       String label, TextInputType inputtype, TextEditingController controller) {
// // //     return TextField(
// // //       decoration: InputDecoration(
// // //         border: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(15),
// // //         ),
// // //         labelText: label,
// // //       ),
// // //       keyboardType: inputtype,
// // //       controller: controller,
// // //     );
// // //   }
// // // }
