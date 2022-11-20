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
   GetData() async{
    String url="https://bara111.000webhostapp.com/login.php";
    Uri u = Uri.parse(url);
    var res = await http.get(u,headers: {"Accept":"application/json"});
    print(res.body);
    var response = json.decode(res.body);
    return response;

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
      body: FutureBuilder(
        future: GetData(),
          builder: ( BuildContext, snapshot)
          {
            List? snap = snapshot.data as List?;
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return const Center(
                  child: Text('error'),
                );

              }
            return ListView.builder(
                itemCount: snap?.length,
                itemBuilder: (context,index)
                {
                  return ListTile(
                    title: Text(snap![index]['Email']),
                    subtitle: Text(snap[index]['Password']),

                  );
                }
            );
          }
      ),
    );
  }
}
