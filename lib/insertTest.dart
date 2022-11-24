import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class WriteSQLdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WriteSQLdataState();
  }
}

class WriteSQLdataState extends State<WriteSQLdata>{

  TextEditingController letterctl = TextEditingController();
  TextEditingController resultctl = TextEditingController();


  late bool error, sending, success;
  late String msg;

  String phpurl = "http://localhost/spellRes.php";
  
  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {

    var res = await http.post(Uri.parse(phpurl), body: {
      "letter": letterctl.text,
      "result": resultctl.text,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if(data["error"]){
        setState(() { //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = data["message"]; //error message from server
        });
      }else{

        letterctl.text = "";
        resultctl.text = "";

        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }

    }else{
      //there is error
      setState(() {
        error = true;
        msg = "Error during sendign data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Write Data PHP & MySQL"),
          backgroundColor:Colors.redAccent
      ), //appbar

      body: SingleChildScrollView( //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
          child:Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[

                Container(
                  child:Text(error?msg:"Enter Student Information"),
                  //if there is error then sho msg, other wise show text message
                ),

                Container(
                  child:Text(success?"Write Success":"send data"),
                  //is there is success then show "Write Success" else show "send data"
                ),

                Container(
                    child: TextField(
                      controller: letterctl,
                      decoration: InputDecoration(
                        labelText:"Full Name:",
                        hintText:"Enter student full name",
                      ),
                    )
                ), //text input for name

                Container(
                    child: TextField(
                      controller: resultctl,
                      decoration: InputDecoration(
                        labelText:"Address:",
                        hintText:"Enter student address",
                      ),
                    )
                ), //text input for address
                FloatingActionButton(onPressed: (){
                  setState(() {
                    sending = true;
                  });
                  sendData();
                })




              ],)
          ),
              ),
    );
  }
}