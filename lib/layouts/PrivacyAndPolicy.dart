import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class PrivacyAndPolicy extends StatefulWidget {

  @override
  _PrivacyAndPolicy createState() => _PrivacyAndPolicy();

}
class _PrivacyAndPolicy extends State<PrivacyAndPolicy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy"),
         backgroundColor: blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Privacy Policy",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Aim Online Helpline app is a donation-based app. In case anyone decides to use our Service, this page informs them of our policies regarding the collection, use, and disclosure of Personal Information.As a condition of using our application, you agree to our collection and disclosure of information concerning this policy. Under this Privacy Policy, we will not disclose or use your information to anyone else.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Information Collection and Use",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. You will have the ability to keep this information on your device; however, we do not collect any of it.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Keeping Donor Information Private ('Our Commitment to Donors')",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Our responsibilities to protect our donors' names and information are very strict. We will not sell, share, or trade their names or information with any other entity, nor will we send mailings to them on their behalf. Donor information is subject to this policy whether received online or offline, via any platform or through electronic, written, or verbal communications.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("In this section, we collect financial information.",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("The Service requires Donors to provide payment card information - including the credit card number, expiration date, and billing address - when making Donations via the Service. We transfer this information to a payment processor.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Protection of Children's Privacy",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Under no circumstance do we target our Services to children under 13, and we do not knowingly collect personally identifiable information about children under 13. If we learn that a child under 13 has provided us with personal information, we immediately delete that information from our servers.We will need to take the necessary measures if you are a parent or guardian and you discover that your child has provided us with personal information.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Changes to This Privacy Policy", style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We may update our Privacy Policy from time to time. Therefore, you should check this page periodically for any updates. We will notify you of any changes by posting the new Privacy Policy on this page.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Contact Us",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at _______________.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),

            ],
          ),
        )
    );
  }
}
