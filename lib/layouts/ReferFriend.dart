import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const lightblue = Color(0xff47b5be);
const paleblue = Color(0xff57c2d7);
const  blue= Color(0xff007ba4);

class ReferFriend  extends StatefulWidget {

  @override
  _ReferFriend createState() => _ReferFriend();

}
class _ReferFriend extends State<ReferFriend> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 550.0),
              child: Column(
                children: [
                 Container(
                  height: 50,
                  width: 200,
                  color: Colors.white,
                ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,size: 35,),
                       SizedBox(width: 10,),
                      FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 35,),
                      SizedBox(width: 10,),
                      FaIcon(FontAwesomeIcons.facebook,color: Colors.white,size: 35,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}