import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class forgetpassw extends StatefulWidget {
  const forgetpassw({Key? key}) : super(key: key);

  @override
  State<forgetpassw> createState() => _forgetpasswState();
}

class _forgetpasswState extends State<forgetpassw> {
  var EmailController = TextEditingController();
  bool isError = false;
  bool showReset = false;
  String verifyLink='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push (
                            context,
                            MaterialPageRoute (
                              builder: (BuildContext context) =>  testlog(  ),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),

                  ),
                ],
              ),
              Spacer(),
              Text("يرجى كتابة البريد الالكتروني الخاص بك هنا",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "DroidKufi",
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.85),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: TextFormField(
                  controller: EmailController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isError,
                child: Text("خطأ ، يرجى التأكد من البريد الالكتروني !",
                    style: TextStyle(
                        color: Colors.red[900],
                        fontFamily: "DroidKufi",
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: showReset,
                      child: ElevatedButton(
                          onPressed: () {
                            Resetpassword();

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                          ),
                          child:  Text("تغيير كلمة المرور",
                              style: TextStyle(
                                color: Colors.green[700],
                                fontFamily: "DroidKufi",
                                fontSize: 22.0,
                              ))),
                    ),
                    SizedBox(width: 15,),
                    ElevatedButton(
                        onPressed: () {
                          CheckEmail();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                        ),
                        child:  Text("البحث عن البريد الإلكتروني",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontFamily: "DroidKufi",
                              fontSize: 22.0,
                            ))),


                  ],
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
  CheckEmail()async{
    var url = 'http://localhost/checkEmail.php';

    var res = await http.post(Uri.parse(url),body: {
      "Email" : EmailController.text,

    });
    var link = json.decode(res.body);
    print(link);
    if (link=="Invalid"){
      setState(() {
        isError =true;
      });
    }
    else
      {
        setState(() {
          isError=false;
          showReset=true;
          verifyLink = link;
        });
      }


  }
  Resetpassword()async{

    var res = await http.post(Uri.parse(verifyLink));
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Column(
          children: [
            Text("تم إرسال كلمة المرور الجديدة الى البريد الالكتروني",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "DroidKufi",
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 20,),

            ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
              Navigator.push (
                context,
                MaterialPageRoute (
                  builder: (BuildContext context) =>  forgetpassw(),
                ),
              );
            }, child: Text("العودة",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DroidKufi",
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),)
          ],
        ),
      );
    });
    var link = json.decode(res.body);

  }
}
