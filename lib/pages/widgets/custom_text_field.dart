import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const backgreen = Color.fromRGBO(131, 190, 99, 1);

class customTextFieldWidget extends StatelessWidget {
  customTextFieldWidget(
      {Key? key,
      required this.nameController,
      required this.ontap,
      required this.text,
      required this.wid,
      required this.hei,
      required this.type,
      this.validation,
      this.hideShow = false})
      : super(key: key);

  final TextEditingController nameController;
  final String text;
  final String? Function(String?)? validation;
  Function ontap;
  final double wid;
  final bool hideShow;
  final double hei;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
      child: Container(
        height: hei,
        width: wid,
        child: TextFormField(
          keyboardType: type,
          validator: validation,
          onTap: () => ontap(),
          textAlign: TextAlign.right,
          controller: nameController,
          obscureText: hideShow,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: backgreen),
            ),
            hintText: text,
          ),
        ),
      ),
    );
  }
}
