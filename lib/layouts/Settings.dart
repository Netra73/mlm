import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class Settings extends StatefulWidget {

  @override
  _Settings createState() => _Settings();

}
class _Settings extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SETTINGS"),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
