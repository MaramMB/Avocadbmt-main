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
      this.hideShow = false,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController nameController;
  final String text;
  final String? Function(String?)? validation;
  Function ontap;
  final double wid;
  final bool hideShow, readOnly;
  final double hei;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
      child: Container(
        height: 45,
        width: 320,
        child: TextFormField(
          keyboardType: type,
          validator: validation,
          onTap: () => ontap(),
          textAlign: TextAlign.right,
          controller: nameController,
          obscureText: hideShow,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'DroidKufi',
              fontSize: 15,
              color: Colors.black38,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            hintText: text,
          ),
        ),
      ),
    );
  }
}
