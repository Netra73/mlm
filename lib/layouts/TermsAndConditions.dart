import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);


  @override
  _TermsAndConditions createState() => _TermsAndConditions();

}
class _TermsAndConditions extends State<TermsAndConditions> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Terms And Conditions"),
          backgroundColor: blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("By downloading or using the app, these terms will automatically apply to you – you should make sure, therefore, that you read them carefully before using the app. We do not allow you to copy or modify any part of our app or trademarks. Do not attempt to extract the source code, translate it into other languages, or create derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to____________.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We're committed to ensuring that the app is as serviceable and efficient as possible. Therefore, we reserve the right to change, disable, or charge for the app at any time. It's significant for us that you know indeed what you're paying for before you use our app or its services.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("It’s your responsibility to keep your phone and access to the app secure. We, therefore, recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone security features, and it could mean that the Aim Online Helpline app won’t work to the core or at all.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("You should be aware that there are certain things that Aim Online Helpline will not take responsibility for. The app must have an active internet connection to perform certain functions. If you don't have access to Wi-Fi or don't have any data left, Aim Online Helpline cannot be held responsible for the app not working at full functionality.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Aim Online Helpline accepts no responsibility for any direct or indirect losses resulting from reliance on this feature alone. Each member who wants to donate has to refer four more people to make donations and join the Peace and Wisdom Foundation.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for both systems may change, and you’ll need to download the updates if you want to keep using the app.",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(" Aim Online Helpline does not guarantee that the app will always be relevant to your needs. It does not guarantee that it works with the Android & iOS versions that you have on hand. But, you pledge to donate at your discretion. No one can compel you to pay your donation under any circumstances.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Changes to This Terms and Conditions",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We may update our Terms and Conditions from time to time. Therefore, you should periodically check this page for any updates. We will notify you of any changes by posting the new Terms and Conditions on this page.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Contact Us",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at __________",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        )
    );
  }
}
