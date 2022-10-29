import 'package:flutter/material.dart';

class forgetpassw extends StatelessWidget {
  const forgetpassw({Key? key}) : super(key: key);

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
              Text("يرجى كتابة البريد الالكتروني الخاص بك هنا",
                  style: TextStyle(
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
                  controller: TextEditingController(),
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
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      // sendEmail();
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
    );
  }
}
