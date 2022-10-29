import 'package:flutter/material.dart';

import 'add_account_form_student.dart';
import 'add_account_form_teacher.dart';

class AddAccountForm extends StatefulWidget {
  const AddAccountForm({Key? key}) : super(key: key);

  @override
  State<AddAccountForm> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {
  String gender = '';

  var idController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var height16 = const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      ),
      // this container contains the whole form
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Text("إنشاء حساب جديد",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Tajawal",
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(20),
                // color: Colors.gr,
              ),
              width: MediaQuery.of(context).size.width / 2,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    children: [




                      height16,
                      SizedBox(height: 30,),
                      buildCreateAccountButton(context),
                      height16,
                      SizedBox(height: 30,),
                      buildCreateAccountButton2(context)
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  ElevatedButton buildCreateAccountButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:MaterialStatePropertyAll(Colors.white),
        padding: MaterialStateProperty.all(
          const  EdgeInsets.symmetric(
              horizontal: 30, vertical: 5),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext ctx) {
            return const AddAccountFormTeacher();
          }),
        );
      },
      child: const Text(
          'المعلم',
          style: TextStyle(
            color: Colors.green,
            fontFamily: "DroidKufi",
            fontSize: 22.0,
          )
      ),
    );
  }
  ElevatedButton buildCreateAccountButton2(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:MaterialStatePropertyAll(Colors.white),
        padding: MaterialStateProperty.all(
          const  EdgeInsets.symmetric(
              horizontal: 30, vertical: 5),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext ctx) {
            return const AddAccountFormStudent();
          }),
        );
      },
      child: const Text(
          'الطالب',
          style: TextStyle(
            color: Colors.green,
            fontFamily: "DroidKufi",
            fontSize: 22.0,
          )
      ),
    );
  }
  SizedBox buildIdInputField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.55,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.85),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily:"Tajawal",
                  fontSize: 25,
                ),
                controller: idController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            color: Colors.transparent,
            width: 120,
            alignment: Alignment.centerRight,
            child: const Text(
              'الرقم',
              style: TextStyle(
                fontFamily: "DroidKufi",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildNameInputField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.55,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.85),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily:"Tajawal",
                  fontSize: 25,
                ),
                controller: nameController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            color: Colors.transparent,
            width: 120,
            alignment: Alignment.centerRight,
            child: const Text(
              'الاسم',
              style: TextStyle(
                fontFamily: "DroidKufi",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildPhoneNumberInputField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.55,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.85),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily:"Tajawal",
                  fontSize: 25,
                ),
                controller: phoneNumberController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            color: Colors.transparent,
            width: 120,
            alignment: Alignment.centerRight,
            child: const Text(
              'رقم الهاتف',
              style: TextStyle(
                fontFamily: "DroidKufi",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildAddressInputField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              // width: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.85),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontFamily:"Tajawal",
                  fontSize: 25,
                ),
                controller: addressController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            color: Colors.transparent,
            width: 120,
            alignment: Alignment.centerRight,
            child: const Text(
              'العنوان',
              style: TextStyle(
                fontFamily: "DroidKufi",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildGenderInputField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.55,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("أنثى",style: TextStyle(fontFamily: "DroidKufi",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,)),
                      value: "female",
                      activeColor: Colors.white,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("ذكر",style: TextStyle(fontFamily: "DroidKufi",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,)),
                      value: "male",
                      activeColor: Colors.white,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            color: Colors.transparent,
            width: 100,
            alignment: Alignment.centerRight,
            child: const Text(
              'الجنس',
              style: TextStyle(
                fontFamily: "DroidKufi",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
