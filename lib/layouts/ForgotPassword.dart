import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPassword createState() => _ForgotPassword();

}
class _ForgotPassword extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text("FORGOT PASSWORD",style: TextStyle(fontSize:30,color: blue,fontWeight: FontWeight.bold),)
              ),
              Padding(
                  padding: EdgeInsets.only(top: 50.0,left: 20.0,right: 10.0),
                  child: Text("PLEASE ENTER YOUR EMAIL ADDRESS YOU WILL RECIEVE A LINK TO GENERATE NEW PASSWORD",style: TextStyle(fontSize:16,color: blue),)
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
                            hintText: "E-MAIL",
                            hintStyle:TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
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
