import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm/layouts/Loginpage.dart';

const blue = Color(0xff47b5be);

class ShareAndEarn extends StatefulWidget {

  @override
  _ShareAndEarn createState() => _ShareAndEarn();

}
class _ShareAndEarn extends State<ShareAndEarn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHARE AND EARN"),
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
