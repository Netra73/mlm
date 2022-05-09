import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class MoneyEarned extends StatefulWidget {

  @override
  _MoneyEarned createState() => _MoneyEarned();

}
class _MoneyEarned extends State<MoneyEarned> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MONEY EARNED BY ME"),
        backgroundColor: blue,
      ),      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          ),
           elevation: 15,
             margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
             child: Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 10.0),
              child: Container(
              height: 50.0,
               child: Padding(
               padding: EdgeInsets.only(top: 10.0),
                 child: Text("TOTAL MONEY EARNED RS-1750",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                 ),
             ),
            ),
      ),
    ),
           Container(
             height: 700,
             child: ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (cc, i) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 15,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 10.0,top: 10.0,bottom: 10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                          backgroundColor: blue,
                          radius: 40.0,
                          child: Icon(Icons.person,color:Colors.white,),
                        ),
                        //SizedBox(width: 10.0,),
                        Text("LEVEL 1"),
                       // SizedBox(width: 10.0,),
                        Text("RS - 250 "),
                        //SizedBox(width: 10.0,),
                      ],
                    ),
                  ),
                ),
              );
          }),
           ),
            ],
          ),
        ),
      ),
    );
  }
}
