import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/modules/User.dart';

const blue = Color(0xff47b5be);

class EditProfile extends StatefulWidget {
   @override
  _EditProfileState createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {
  User user = User();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor:blue,
      ),
      body:  SingleChildScrollView(
        child: FutureBuilder(
          builder: (context,snapshot) {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 2.0,left: 25.0,right: 20.0),
                      child: Text("Name :",style: TextStyle(color:Color(0xff198d97)),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          else{
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 1,color: blue),
                            ),
                            hintText: 'Enter Password',
                            hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(color: blue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                        ),
                      ),
                    ),
                    Container(
                      width: 180.0,
                      height: 50.0,
                      margin: EdgeInsets.only(left:100.0,top:30.0),
                      child: ElevatedButton(
                        child: Text('Update',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                        style: ElevatedButton.styleFrom(
                          primary:blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (){

                          },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
