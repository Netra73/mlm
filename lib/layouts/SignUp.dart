import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/api/PostPayment.dart';
import 'package:mlm/api/PostSignUp.dart';
import 'package:mlm/functions/UserData.dart';
import 'package:mlm/functions/validations.dart';
import 'package:mlm/layouts/HomePage.dart';
import 'package:mlm/layouts/Loginpage.dart';
import 'package:mlm/layouts/SignUpBankDetails.dart';
import 'package:mlm/layouts/TermsAndConditions.dart';
import 'package:mlm/modules/UserForm.dart';
import 'package:url_launcher/url_launcher.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class SignUp extends StatefulWidget {

  @override
  _SignUp createState() => _SignUp();

}
class _SignUp extends State<SignUp> {
  final _signUpForm  = GlobalKey<FormState>();
  UserForm userForm = UserForm();
  bool mblError= false;
  bool accNumError= false;
  bool referenceError= false;
  bool invalidError= false;
  bool upierror= false;
  bool emailError=false;
  bool acnumError=false;
  bool autovalidate = false;
  bool isError = false;
  String errorMsg ="";
 // String url ="https://www.frchg.in/JfbIxiF";

  _launchURL() async {
    const url = "https://www.frchg.in/JfbIxiF";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      throw "Could not launch $url";
    }
  }

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
                child: Text("CREATE ACCOUNT",style: TextStyle(fontSize:30,color: blue,fontWeight: FontWeight.bold),)
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
                          return 'Enter your first name';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.name = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                           borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter Your Name",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'NAME',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your address';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.address = value;
                      },

                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter Your Address",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue,))

                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        return mobileRequired(value!, "Enter valid mobile number");
                      },
                      onSaved: (value){
                        userForm.mobile = value!;
                      },
                      onChanged:(val){
                        setState(() {
                          mblError=false;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter your Phone Number",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'PHONE NUMBER',
                          labelStyle: TextStyle(color: lightblue),

                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  if(mblError)
                    Padding(
                      padding: EdgeInsets.only(right:80.0,left: 20.0),
                      child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        return emailRequired(value!, "Enter valid email id");
                      },
                      onSaved: (value){
                        userForm.email = value;
                      },
                      onChanged:(val){
                        setState(() {
                          emailError=false;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter Your Email Id ",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'Email Id',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your reference id';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.reference_id = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: "Enter Reference Id ",
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'REFERENCE ID',
                          labelStyle: TextStyle(color: lightblue),

                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                  if(referenceError)
                    Padding(
                      padding: EdgeInsets.only(right:80.0,left: 20.0),
                      child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                    ),if(invalidError)
                    Padding(
                      padding: EdgeInsets.only(right:80.0,left: 20.0),
                      child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
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
                      onSaved: (value){
                        userForm.password=value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: lightblue),
                          ),
                          hintText: 'Enter Password',
                          hintStyle:TextStyle(color: blue,fontWeight: FontWeight.w200),
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:blue))
                      ),
                    ),
                  ),
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
                          ),
                          hintText: " Enter Account Holder Name",
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
                        return validateMobile(value!, "Enter valid account number");
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
                          labelText: 'ACCOUNT NUMBER',
                          labelStyle: TextStyle(color: lightblue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:lightblue))
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  if(accNumError)
                    Padding(
                      padding: EdgeInsets.only(right:80.0,left: 20.0),
                      child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
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
                  if(upierror)
                    Padding(
                      padding: EdgeInsets.only(right:80.0,left: 20.0),
                      child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                    ),
                  SizedBox(height: 20,),
                  Center(
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  TermsAndConditions(),
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
                          onPressed: ()async {
                              _checkValidate();
                            /* final url ="https://www.frchg.in/JfbIxiF";
                            if (await canLaunch(url)) {
                            await launch(url);
                            } else {
                            throw 'Could not launch $url';
                            }*/
                           // _launchURL();
                          }
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:40.0),
                        child: Text("AlREADY HAVE AN ACCOUNT ? ",style: TextStyle(fontSize: 18,color: lightblue,),),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                LoginPage()), (Route<dynamic> route) => false);
                          });
                        },
                        child: Text("LOGIN",style: TextStyle(fontSize: 18,decoration:TextDecoration.underline,color: lightblue),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                 /* Center(
                    child: FloatingActionButton(
                      child: Icon(
                          Icons.arrow_forward
                      ),
                      backgroundColor: lightblue,
                      onPressed: (){
                        _checkValidate();

                      },
                      heroTag: null,
                    ),
                  ),*/
                  /*  Padding(
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
                      validator: (value){
                        return mobileRequired(value!, "Enter valid account number");
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
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                          hintText: "ACCOUNT NUMBER",
                          hintStyle:TextStyle(color: blue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
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
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                          hintText: "UPI ID ",
                          hintStyle:TextStyle(color: blue),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),*/
                 // SizedBox(height: 20,),
                 /* Center(
                    child: Container(
                        width: 250.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                  ),*/
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
             /* Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);*/

              PostPayment().then((value){
                var response = value;
                Navigator.pop(context);
                if(response.statusCode == 200){
                  setState(() {
                    var data = response.data['data'];

                  });
                }
              }).catchError((error){
                if(error is DioError){
                  Navigator.pop(context);
                  if(error.response?.statusCode == 400){
                    setState(() {

                    });
                  }
                }
              });



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
           /* if(errorMsg== 'The given Mobile number already exists.'){
              mblError= true;
            }else{
              emailError =true;
            }*/
            if (errorMsg== 'The given Mobile number already exists.') {
              mblError= true;
            }
            else if (errorMsg =='The given acc number already exists.') {
              accNumError = true;
            }
            else if (errorMsg =='You are Too late, Please contact your Admin') {
              referenceError = true;
            }
            else if (errorMsg =='Invalid Reference ID please contact Admin for further details.') {
              invalidError = true;
            }
            else {
              upierror = true;
              }
          });
        }
      }
    });
  }
}
