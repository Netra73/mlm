import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mlm/functions/Config.dart';
import 'package:mlm/modules/UserForm.dart';

Future<Response> PostSignUp(UserForm userForm) async {
  var body =
  {
    'name' : userForm.name,
    'mobile' : userForm.mobile,
    'email':userForm.email,
    'password':userForm.password,
    'upi':userForm.upi,
    'acc_holder_name':userForm.acc_holder_name,
    'acc_number':userForm.acc_number,
    'ifsc_code':userForm.ifsc_code,
    'bank_name':userForm.bank_name,
    'address':userForm.address,
    'reference_id':userForm.reference_id,
  };

  final response = await   Dio().postUri(Uri.parse(API_URL+'signup'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'})
  );
  print(response);
  return response;

}