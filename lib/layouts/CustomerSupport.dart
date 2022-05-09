import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class CustomerSupport extends StatefulWidget {

  @override
  _CustomerSupport createState() => _CustomerSupport();

}
class _CustomerSupport extends State<CustomerSupport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CUSTOMER SUPPORT"),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
