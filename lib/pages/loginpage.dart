import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Profile/profile.dart';
import 'package:flutter_application_1/pages/manage.dart';
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
               context, MaterialPageRoute(builder: (context) => mainpage(),),);
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
// import 'package:flutter/material.dart';
// import 'valid.php';
// // import 'LoginRequestData.dart';
//
// class LoginPage extends StatefulWidget {
//   static String tag = 'login-page';
//
//   @override
//   State<StatefulWidget> createState() {
//     return _LoginPageState();
//   }
// }
//
// class _LoginPageState extends State<LoginPage> {
//   GlobalKey<FormState> _key = GlobalKey();
//   bool _validate = false;
//   LoginRequestData _loginData = LoginRequestData();
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.all(20.0),
//             child: Center(
//               child: Form(
//                 key: _key,
//                 // autovalidateMode: _validate,
//                 child: _getFormUI(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _getFormUI() {
//     return Column(
//       children: <Widget>[
//         Icon(
//           Icons.person,
//           color: Colors.lightBlue,
//           size: 100.0,
//         ),
//         SizedBox(height: 50.0),
//         TextFormField(
//           keyboardType: TextInputType.emailAddress,
//           autofocus: false,
//           decoration: InputDecoration(
//             hintText: 'Email',
//             contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             border:
//             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//           ),
//           // validator: FormValidator().validateEmail,
//           // onSaved: (String value) {
//           //   _loginData.email = value;
//           // },
//         ),
//         SizedBox(height: 20.0),
//         TextFormField(
//             autofocus: false,
//             obscureText: _obscureText,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//               border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//               suffixIcon: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//                 child: Icon(
//                   _obscureText ? Icons.visibility : Icons.visibility_off,
//                   semanticLabel:
//                   _obscureText ? 'show password' : 'hide password',
//                 ),
//               ),
//             ),
//             validator: FormValidator().validatePassword,
//             onSaved: (String value) {
//               _loginData.password = value;
//             }),
//         SizedBox(height: 15.0),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 16.0),
//           child: RaisedButton(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//             ),
//             onPressed: _sendToServer,
//             padding: EdgeInsets.all(12),
//             color: Colors.lightBlueAccent,
//             child: Text('Log In', style: TextStyle(color: Colors.white)),
//           ),
//         ),
//         FlatButton(
//           child: Text(
//             'Forgot password?',
//             style: TextStyle(color: Colors.black54),
//           ),
//           onPressed: _showForgotPasswordDialog,
//         ),
//         FlatButton(
//           onPressed: _sendToRegisterPage,
//           child: Text('Not a member? Sign up now',
//               style: TextStyle(color: Colors.black54)),
//         ),
//       ],
//     );
//   }
//
//   _sendToRegisterPage() {
//     ///Go to register page
//   }
//
//   _sendToServer() {
//     if (_key.currentState.validate()) {
//       /// No any error in validation
//       _key.currentState.save();
//       print("Email ${_loginData.email}");
//       print("Password ${_loginData.password}");
//     } else {
//       ///validation error
//       setState(() {
//         _validate = true;
//       });
//     }
//   }
//
//   Future<Null> _showForgotPasswordDialog() async {
//     await showDialog<String>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Please enter your eEmail'),
//             contentPadding: EdgeInsets.all(5.0),
//             content: TextField(
//               decoration: InputDecoration(hintText: "Email"),
//               onChanged: (String value) {
//                 _loginData.email = value;
//               },
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("Ok"),
//                 onPressed: () async {
//                   _loginData.email = "";
//                   Navigator.pop(context);
//                 },
//               ),
//               FlatButton(
//                 child: Text("Cancel"),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ],
//           );
//         });
//   }
// }
//
// class LoginRequestData {
//   String email = '';
//   String password = '';
// }
// // import 'package:flutter/material.dart';
// //
// // class login extends StatefulWidget {
// //   @override
// //   _loginState createState() => _loginState();
// // }
// //
// // class _loginState extends State<login> {
// //   GlobalKey<FormState> formkey = GlobalKey<FormState>();
// //
// //   TextFormField(
// //   decoration: InputDecoration(
// //   border: OutlineInputBorder(),
// //   labelText: 'Password',
// //   hintText: 'Enter secure password'),
// //   ),
// //   // var _formKey = GlobalKey<FormState>();
// //   var isLoading = false;
// //
// //   void _submit() {
// //     final isValid = _formKey.currentState?.validate();
// //     if (!isValid!) {
// //       return;
// //     }
// //     _formKey.currentState?.save();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Form Validation"),
// //         leading: Icon(Icons.filter_vintage),
// //       ),
// //       //body
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         //form
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: <Widget>[
// //               //styling
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.width * 0.1,
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'E-Mail'),
// //                 keyboardType: TextInputType.emailAddress,
// //                 onFieldSubmitted: (value) {
// //                   //Validator
// //                 },
// //                 validator: (value) {
// //                   if (value!.isEmpty ||
// //                       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
// //                           .hasMatch(value)) {
// //                     return 'Enter a valid email!';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               //box styling
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.width * 0.1,
// //               ),
// //               //text input
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'Password'),
// //                 keyboardType: TextInputType.emailAddress,
// //                 onFieldSubmitted: (value) {},
// //                 obscureText: true,
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Enter a valid password!';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.width * 0.1,
// //               ),
// //               ElevatedButton(
// //                 // padding: EdgeInsets.symmetric(
// //                 //   vertical: 10.0,
// //                 //   horizontal: 15.0,
// //                 // ),
// //                 child: Text(
// //                   "Submit",
// //                   style: TextStyle(
// //                     fontSize: 24.0,
// //                   ),
// //                 ),
// //                 onPressed: () => _submit(),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
