import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class BankInfo extends StatefulWidget {

  @override
  _BankInfo createState() => _BankInfo();

}
class _BankInfo extends State<BankInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 40.0,
                  child: Icon(
                    Icons.person,
                    size: 80.0,
                    color: blue,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("BANK INFO",style: TextStyle(fontSize:30,color: blue,fontWeight: FontWeight.bold),)
              ),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "ACCOUNT HOLDER NAME",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "ACCOUNT NUMBER",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "BANK NAME",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(

                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "IFSC CODE ",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "UPI ID ",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                          width: 250.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: blue,
                              shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                            },
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>  LoginPage(),
                              ));
                            });
                          },
                          child: Text("LOGIN",style: TextStyle(fontSize: 18,decoration:TextDecoration.underline,color: blue),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
