import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/api/getUser.dart';
import 'package:mlm/functions/UserData.dart';
import 'package:mlm/layouts/EditProfile.dart';
const blue = Color(0xff47b5be);

class MyAccount extends StatefulWidget {

  @override
  _MyAccount createState() => _MyAccount();

}
class _MyAccount extends State<MyAccount> {
String id="";
String name="";
String email="";
String mobile="";
String upi="";
String acc_holder_name="";
String acc_number="";
String ifsc_code="";
String bank_name="";
String address="";
String reference_id="";
bool response = false;
bool udata = false;

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Account',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor:blue,
      ),
      body:
    /* SingleChildScrollView(
        child: FutureBuilder(
            future:getUser(id),
            builder: (context,snapshot) {
              if (snapshot.hasData) {
                var data = jsonDecode(snapshot.data);
                if(data["status"]==200) {
                  response = true;
                  var udata = data["data"];
                  id = udata['id'];
                  name = udata['name'];
                  mobile = udata['mobile'];
                  email = udata['email'];
                }
                return Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom:30.0, top: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Row(
                              children: [
                                Icon(Icons.person, size: 20.0,),
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Row(
                              children: [
                                Icon(Icons.phone_android, size: 20.0),
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(mobile, style: TextStyle(fontSize: 18),)
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Row(
                              children: [
                                Icon(Icons.email, size: 20.0),
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Text(email, style: TextStyle(fontSize: 18),)
                                )
                              ],
                            ),
                          ),
                          if(bankdetails) Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text("UPI : " + upi, style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text("Bank Name : " + bankName,
                                          style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text(
                                          "A/c Name : " + bankAccName,
                                          style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text(
                                          "A/c Number : " + bankAccNumber,
                                          style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text("Bank Branch : " + bankBranch,
                                          style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Row(
                                  children: [
                                    //  Icon(Icons.qr_code, size: 20.0),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                        child: Text("IFSC : " + bankIfsc,
                                          style: TextStyle(fontSize: 18),)
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(
                              width: 180.0,
                              height: 40.0,
                              margin: EdgeInsets.only(left: 1.0, top: 20.0,bottom: 20.0),
                              child: ElevatedButton(
                                child: Text('Edit Profile', style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff198d97),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfile())).then((value){
                                    setState(() {

                                    });
                                  });

                                },
                              )
                          ),

                        ],
                      ),
                    ),


                  ],
                );
              }
              return SpinKitCircle(
                color: blue,
                size: 50,
              );
            }
        ),
      ),*/
          Column(
               children: [
                 Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16.0),
                   ),
                   color: Colors.white,
                   elevation: 10,
                   margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom:30.0, top: 20.0),
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: 20.0, left: 20.0),
                         child: Row(
                           children: [
                             Icon(Icons.person, size: 20.0,),
                             Container(
                                 margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                 child: Text(name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 20.0, left: 20.0),
                         child: Row(
                           children: [
                             Icon(Icons.phone_android, size: 20.0),
                             Container(
                                 margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                 child: Text(mobile, style: TextStyle(fontSize: 18),)
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 20.0, left: 20.0),
                         child: Row(
                           children: [
                             Icon(Icons.email, size: 20.0),
                             Container(
                                 margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                 child: Text(email, style: TextStyle(fontSize: 18),)
                             )
                           ],
                         ),
                       ),
                        Column(
                         children: [
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text("REFERENCE ID : " + reference_id, style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text("UPI : " + upi, style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text("Bank Name : " + bank_name,
                                       style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text(
                                       "A/c Name : " + acc_holder_name,
                                       style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text(
                                       "A/c Number : " + acc_number,
                                       style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text("Bank Branch : " + address,
                                       style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(top: 20.0, left: 20.0),
                             child: Row(
                               children: [
                                 //  Icon(Icons.qr_code, size: 20.0),
                                 Container(
                                     margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                     child: Text("IFSC : " + ifsc_code,
                                       style: TextStyle(fontSize: 18),)
                                 )
                               ],
                             ),
                           ),
                           SizedBox(height: 20,)
                         ],
                       ),

                      /* Container(
                           width: 180.0,
                           height: 50.0,
                           margin: EdgeInsets.only(left: 1.0, top: 20.0,bottom: 20.0),
                           child: ElevatedButton(
                             child: Text('Edit Profile', style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18),),
                             style: ElevatedButton.styleFrom(
                               primary:blue,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20),
                               ),
                             ),
                             onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                   builder: (context) =>
                                       EditProfile()));
                              },
                           )
                       ),*/

                     ],
                   ),
                 ),
      ]
    ),
    );
  }
_getUserDetails(){
  checkData("USER").then((value) {
    getData("USER_DATA").then((value) {
      if (value != null) {
        var data = jsonDecode(value);
        setState(() {
          id = data['id'];
        });
      }
      getUser(id).then((value) {
        var response = value;
        if(response.statusCode == 200){
          setState(() {
            udata == true;
            var data = response.data['data'];
            name =data["name"];
            mobile =data["mobile"];
            email =data["email"];
            upi =data["upi"];
            acc_holder_name =data["acc_holder_name"];
            acc_number =data["acc_number"];
            ifsc_code =data["ifsc_code"];
            bank_name =data["bank_name"];
            address =data["address"];
            reference_id =data["reference_id"];
          });
        }
      });
    });

  });

}

}