import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mlm/functions/Config.dart';
import 'package:mlm/modules/LoginForm.dart';

Future<Response> PostPayment() async {
  var body =
  {
    'amount': '200',
  };

  final response = await   Dio().postUri(Uri.parse('https://checkout-sandbox.freecharge.in/'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  print(response);
  return response;
}