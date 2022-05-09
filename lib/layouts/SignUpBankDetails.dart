import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/api/PostSignUp.dart';
import 'package:mlm/functions/UserData.dart';
import 'package:mlm/functions/validations.dart';
import 'package:mlm/layouts/HomePage.dart';
import 'package:mlm/layouts/Loginpage.dart';
import 'package:mlm/layouts/Terms.dart';
import 'package:mlm/modules/UserForm.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class SignUpBankDetails extends StatefulWidget {

  @override
  _SignUpBankDetails createState() => _SignUpBankDetails();

}
class _SignUpBankDetails extends State<SignUpBankDetails> {
  final _signUpForm  = GlobalKey<FormState>();
  UserForm userForm = UserForm();
  bool mblError= false;
  bool emailError=false;
  bool acnumError=false;
  bool autovalidate = false;
  bool isError = false;
  String errorMsg ="";


  bool isValid = false;

  _checkValidate() {
    isValid = _signUpForm.currentState!.validate();
    if (isValid) {
      _signUpForm.currentState!.save();
      _signUp();
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
        backgroundColor:lightblue ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
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
              key: _signUpForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your account holder name';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.acc_holder_name = value;
                      },
                      decoration: InputDecoration(
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),                          hintText: " Enter Account Holder Name",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'ACCOUNT HOLDER NAME',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        return numberRequired(value!, "Enter valid account number");
                      },
                      onSaved: (value){
                        userForm.acc_number = value!;
                      },
                      onChanged:(val){
                        setState(() {
                          acnumError=false;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter Your Account Number",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'ACCOUNT HOLDER NAME',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your bank name';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.bank_name = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Eg : SBI",
                          hintStyle:TextStyle(color:blue,fontWeight: FontWeight.w200),
                          labelText: 'BANK NAME',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter ifsc code';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.ifsc_code = value!;
                      },

                      decoration: InputDecoration(
                          fillColor: Colors.red,
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Eg: SBI12001 ",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'IFSC CODE',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your bank name';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.upi = value;
                      },

                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Eg: 1234567891@ybl ",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'UPI ID',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                   SizedBox(height: 20,),
                   Center(
                       child: GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) =>  Terms(),
                           ));
                         },
                           child: Text("TERMS AND CONDITIONS",style:TextStyle(color: lightblue,decoration:TextDecoration.underline),
                           )
                       )
                   ),
                   SizedBox(height: 20,),
                   Center(
                    child: Container(
                        width: 150.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            primary: lightblue,
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            _checkValidate();

                          },
                        )
                    ),
                  ),
                  // SizedBox(height: 20,),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:40.0),
                        child: Text("AlREADY HAVE AN ACCOUNT ? ",style: TextStyle(fontSize: 18,color: blue),),
                      ),
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
                  ),*/
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _signUp(){
    _showLoading();
    PostSignUp(userForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          String id = response.data['id'];
          print(id);
          var data = response.data['data'];
          setData("USER",id ).then((value){
            setData("USER_DATA", jsonEncode(data)).then((value){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);
            });
          });
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {
            errorMsg = error.response!.data['message'];
            if(errorMsg== 'The given Mobile number already exists.'){
              mblError= true;
            }else{
              emailError =true;
            }
          });
        }
      }
    });
  }
}
