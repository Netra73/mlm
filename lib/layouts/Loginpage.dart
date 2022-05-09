import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/api/PostLogin.dart';
import 'package:mlm/functions/UserData.dart';
import 'package:mlm/functions/validations.dart';
import 'package:mlm/layouts/BankInfo.dart';
import 'package:mlm/layouts/ForgotPassword.dart';
import 'package:mlm/layouts/HomePage.dart';
import 'package:mlm/layouts/Reference.dart';
import 'package:mlm/layouts/SignUp.dart';
import 'package:mlm/layouts/VerifiedPage.dart';
import 'package:mlm/modules/LoginForm.dart';
const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class LoginPage extends StatefulWidget {

  @override
  _Login createState() => _Login();

}
class _Login extends State<LoginPage> {
  final _loginForm  = GlobalKey<FormState>();
  LoginForm loginForm = LoginForm();

  bool wrngnumError = false;
  bool wrngpaswdError = false;
  String errorMsg ="";
  bool autovalidate = false;
  bool isValid = false;

  _checkValidate() {
    isValid = _loginForm.currentState!.validate();
    if (isValid) {
      _loginForm.currentState!.save();
      _login();
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
        return Container(
          child: Center(
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
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Container(
                height: 100,
                width: 230,
                child: Image(
                  image: AssetImage("assets/image/aimlogo.png") ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
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
              child: Text("Login",style: TextStyle(fontSize:30,color: blue),)
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _loginForm,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },

                        onSaved: (value){
                          loginForm.mobile = value!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 1,color: lightblue),
                            ),
                            hintText: "Enter Mobile Number",
                            hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(color: lightblue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                        ),
                        onChanged:(val){
                          setState(() {
                            wrngnumError=false;
                          });
                        },
                        keyboardType: TextInputType.phone,                      ),
                    ),
                    if(wrngnumError)
                      Padding(
                        padding: EdgeInsets.only(right:220.0),
                        child:Text(errorMsg,style: TextStyle(fontSize:16,color: Colors.red),),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          loginForm.password = value!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 1,color: lightblue),
                            ),
                            hintText: "Enter Your Password",
                            hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: lightblue),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                        ),
                        onChanged:(val){
                          setState(() {
                            wrngpaswdError=false;
                          });
                        },
                      ),
                    ),
                    if(wrngpaswdError)
                      Padding(
                        padding: EdgeInsets.only(right:220.0),
                        child:Text(errorMsg,style: TextStyle(fontSize:16,color: Colors.red),),
                      ),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.only(left: 200.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  ForgotPassword(),
                            ));
                          },
                          child: Text('Forgot password?',style: TextStyle(fontSize: 18,color: lightblue),
                          ),
                        ),
                    ),

                    SizedBox(height: 40,),
                    Container(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('DONT HAVE AN ACCOUNT? ',style: TextStyle(fontSize:18,color: lightblue),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  SignUp(),
                            ));
                          },
                          child: Text('SIGN UP',style: TextStyle(fontSize: 18,decoration: TextDecoration.underline,color: lightblue
                          ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
                     ],
        ),
      ),
    );
  }
  _login() {
    _showLoading();
    PostLogin(loginForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          String id = data['id'];
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
            print(errorMsg);
            if(errorMsg=='Wrong email.'){
              wrngnumError= true;
            }else{
              wrngpaswdError =true;
            }
          });
        }
      }
    });
  }
}
