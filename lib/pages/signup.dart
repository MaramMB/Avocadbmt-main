import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  List list=[];
  Future GetData() async{
    var url="http://192.168.1.114/Avocadbmt-main/Avocadbmt-main/login.php";
    var res=await http.get(Uri.parse(url));
    print(res);
    if(res.statusCode==200)
      {
        // var red =json.decode(res.body);
        var red =json.decode(res.body);
        setState(() {
          list.addAll(red);
        });
        print(red);
      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount:list.length,
          itemBuilder: (cts,i){
            // print(list.length);
        return const ListTile(
        title:Text("User"),
          subtitle: Text("user"),
          leading: CircleAvatar(
            radius: 30,
            child: Text("MB"),
          ),
        );
    }
    )
    );
  }
}
