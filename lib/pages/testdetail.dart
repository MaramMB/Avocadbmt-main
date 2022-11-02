import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'firsttestdata.dart';

class TestDetail extends StatefulWidget {
  final List<FirstTest> testDataModel;
  int index;
  TestDetail({Key? key, required this.index, required this.testDataModel}) : super(key: key);

  @override
  State<TestDetail> createState() => _TestDetailState();
}

class _TestDetailState extends State<TestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.testDataModel[widget.index].name),),
      body: Column(
        children: [
          Image.network(widget.testDataModel[widget.index].ImageUrl),
          SizedBox(
            height: 10,
          ),
          Text(widget.testDataModel[widget.index].desc,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: "f1",
                onPressed: (){
                  setState(() {
                    if(widget.index!=0){
                      widget.index --;
                    }
                  });
                },
                child:Icon(Icons.arrow_back_ios) ,
              ),
              FloatingActionButton(
                heroTag: "f2",
                onPressed: (){
                  setState(() {
                    if(widget.index != widget.testDataModel.length-1){
                      widget.index ++;
                    }
                  });
                },
                child:Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/firsttestdata.dart';
// import 'dart:convert';
//
// class testDetail extends StatefulWidget {
//   final List<testDataModel> TestData;
//   int index;
//   testDetail({Key? key, required this.index, required this.TestData}) : super(key: key);
//
//   @override
//   State<testDetail> createState() => _testDetailState();
// }
//
// class _testDetailState extends State<testDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.TestData[widget.index].word),),
//       body: Column(
//         children: [
//           Image.network(widget.TestData[widget.index].ImageUrl),
//           SizedBox(
//             height: 10,
//           ),
//           Text(widget.TestData[widget.index].later,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               FloatingActionButton(
//                 heroTag: "f1",
//                 onPressed: (){
//                   setState(() {
//                     if(widget.index!=0){
//                       widget.index --;
//                     }
//                   });
//                 },
//                 child:Icon(Icons.arrow_back_ios) ,
//               ),
//               FloatingActionButton(
//                 heroTag: "f2",
//                 onPressed: (){
//                   setState(() {
//                     if(widget.index != widget.TestData.length-1){
//                       widget.index ++;
//                     }
//                   });
//                 },
//                 child:Icon(Icons.arrow_forward_ios),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }