import 'package:flutter/material.dart';

class AddAccountFormTeacher extends StatefulWidget {
  const AddAccountFormTeacher({Key? key}) : super(key: key);

  @override
  State<AddAccountFormTeacher> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountFormTeacher> {


  var idController = TextEditingController();
  var nameController = TextEditingController();
  var idCardController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var associationNumController=TextEditingController();
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
            const Text("إنشاء حساب جديد للمعلم",
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
                      Column(
                        children: [
                          buildIdInputField(),
                          height16,
                          buildNameInputField(),
                          height16,
                          buildId_CardInputField(),
                          height16,
                          buildPhoneNumberInputField(),
                          height16,
                          buildAssociationNumInputField(),
                        ],
                      ),
                      height16,
                      SizedBox(height: 30,),
                      buildCreateAccountButton(context)
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
        if (idController.text.isEmpty ||
            nameController.text.isEmpty ||
            phoneNumberController.text.isEmpty ||
            idCardController.text.isEmpty ||
            associationNumController.text.isEmpty
        ) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('من فضلك أدخل جميع الحقول'),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else {
          _formKey.currentState?.reset();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء الحساب'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: const Text(
          'إنشاء الحساب',
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

  SizedBox buildId_CardInputField() {
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
                controller: idCardController,
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
              'رقم الهوية',
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

  SizedBox buildAssociationNumInputField() {
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
                controller: associationNumController,
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
              'رقم الجمعية',
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
