import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
String username='';

class logintesttest extends StatefulWidget {
  @override
  _logintesttestState createState() => _logintesttestState();
}

class _logintesttestState extends State<logintesttest> {
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  String msg='';

   login() async {
    const url="http://192.168.1.114/Avocadbmt-main/Avocadbmt-main/login.php";

    final response =await http.post(Uri.parse(url),body:{
      "Email":email.text,
      "pass":pass.text,
    });
    var data = jsonDecode(response.body);
    print(data);

    if(data =="success")
      {
        // Fluttertoast.showToast(
        //   msg: "login success",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.CENTER,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white70,
        //   fontSize: 20,
        // );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>mainpage()));
        print(data['Kind']);
      }
    else{
      Fluttertoast.showToast(
        msg: "Email or passwors is not correct",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white70,
        fontSize: 20,
      );
    }
  }
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  late String _email,_pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email"
              ),
            ),
            TextFormField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password"
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  login();
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