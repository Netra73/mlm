import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mlm/functions/Config.dart';
import 'package:mlm/modules/LoginForm.dart';

Future<Response> PostLogin(LoginForm loginForm) async {
  var body =
  {
    'mobile': loginForm.mobile,
    'password': loginForm.password
  };

  final response = await   Dio().postUri(Uri.parse(API_URL+'userLog'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  return response;
}