import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const backgreen = Color.fromRGBO(131, 190, 99, 1);

class joinus extends StatefulWidget {
  const joinus({Key? key}) : super(key: key);

  @override
  State<joinus> createState() => _joinusState();
}

final namecontroler = TextEditingController();
final subjcontroler = TextEditingController();
final emailcontroler = TextEditingController();
final massgcontroler = TextEditingController();

Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const servicedID = "service_f2q9eip";
  const tempId = "template_nd74zk9";
  const userid = "TrbWq7Sfjxj50rEl_";
  final response = await http.post(url,
      headers: {'Contact-Type': 'application/json'},
      body: json.encode({
        "service_id": servicedID,
        "template_id": tempId,
        "user_id": userid,
        "template_params": {
          "name": namecontroler.text,
          "subject": subjcontroler.text,
          "message": massgcontroler.text,
          "user_email": emailcontroler.text,
        }
      }));
  return response.statusCode;
}

class _joinusState extends State<joinus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: backgreen,
          child: Center(
            child: Container(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          "انضم لنا",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Tajawal",
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Center(
                        child: Text(
                          "ارسل لنا بياناتك وسنتواصل معك",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "DroidKufi",
                              fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("الاسم",
                          style: TextStyle(
                              fontFamily: "DroidKufi",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: namecontroler,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("الايميل",
                          style: TextStyle(
                              fontFamily: "DroidKufi",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: emailcontroler,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("رقم الهاتف",
                          style: TextStyle(
                              fontFamily: "DroidKufi",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: subjcontroler,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("الرسالة",
                          style: TextStyle(
                              fontFamily: "DroidKufi",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          controller: massgcontroler,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            // icon: Icon(Icons.message),
                            // hintText: 'Message',
                            // labelText: 'Message',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              sendEmail();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                            ),
                            child: const Text("أرسال",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "DroidKufi",
                                  fontSize: 22.0,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
