import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class AboutUs extends StatefulWidget {

  @override
  _AboutUs createState() => _AboutUs();

}
class _AboutUs extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOUT US"),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
