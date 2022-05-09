import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mlm/api/CheckReference.dart';
import 'package:mlm/layouts/Loginpage.dart';
import 'package:mlm/layouts/SignUp.dart';
import 'package:mlm/layouts/VerifiedPage.dart';
import 'package:mlm/modules/ReferenceForm.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class Reference extends StatefulWidget {
  const Reference({Key? key}) : super(key: key);


  @override
  _Reference createState() => _Reference();

}
class _Reference extends State<Reference> {
  final _referenceForm  = GlobalKey<FormState>();
  ReferenceForm referenceForm = ReferenceForm();

  bool isValid = false;
  bool autovalidate = false;

  _checkValidate() {
    isValid = _referenceForm.currentState!.validate();
    if (isValid) {
      _referenceForm.currentState!.save();
      _checkReference();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }
  _showLoading() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AIM 2.1"),
        backgroundColor: blue,
      ),
        body:
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/referid.jpg"),
                    fit: BoxFit.cover
                ) ,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 400.0),
                child: TextFormField(
                  validator: (value){
                    if (value==null||value.isEmpty) {
                      return 'Enter REFERENCE ID';
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (value){
                  },
                  decoration: InputDecoration(
                      prefixIcon:Icon(Icons.person,color: lightblue,),
                      suffixIcon: ElevatedButton(
                        child: Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          primary: lightblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          _checkValidate();

                        },
                      ),
                      fillColor: Colors.white, filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(width: 1,color: lightblue),
                      ),
                      hintText: "Enter REFERENCE ID",
                      hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                      // labelText: 'REFERENCE ID',
                      // labelStyle: TextStyle(color: lightblue),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                  ),
                ),
              ),
            ),
          ],
        ),
      /*SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _referenceForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                  child: TextFormField(
                    validator: (value){
                      if (value==null||value.isEmpty) {
                        return 'Enter your Reference id';
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      referenceForm.reference_id = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                        hintText: "Enter Reference Id",
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
                          _checkValidate();

                        },
                      )
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
  _checkReference(){
    _showLoading();
    CheckReference(referenceForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              VerifiedPage()), (Route<dynamic> route) => false);
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {
            Fluttertoast.showToast(
                msg: "Enter Correct REFERENCE ID",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
            );
          });
        }
      }
    });
  }
}
