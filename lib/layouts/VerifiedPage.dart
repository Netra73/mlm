import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mlm/api/CheckReference.dart';
import 'package:mlm/layouts/Loginpage.dart';
import 'package:mlm/layouts/SignUp.dart';
import 'package:mlm/modules/ReferenceForm.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({Key? key}) : super(key: key);


  @override
  _VerifiedPage createState() => _VerifiedPage();

}
class _VerifiedPage extends State<VerifiedPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
            child: Container(
              height: 200,
              width: 200,
              child:

              TweenAnimationBuilder<double>(
               tween: Tween<double>(begin: 0.0, end: 3),
               duration: const Duration(milliseconds: 2000),
               builder: (context, value, _) => CircularProgressIndicator(value: value,color: Colors.green),
          ),
            ),
          ),
            SizedBox(height: 20.0,),
            Text("Verified",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),
            Container(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  child: Text('SignUp Now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: lightblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // _checkValidate();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>  SignUp(),
                    ));

                  },
                )
            ),
          ],
        )

    );
  }

}
