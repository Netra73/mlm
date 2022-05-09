import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mlm/functions/Config.dart';
import 'package:mlm/modules/ReferenceForm.dart';
import 'package:mlm/modules/UserForm.dart';

Future<Response> CheckReference(ReferenceForm referenceForm) async {
  var body =
  {
    'reference_id' : referenceForm.reference_id,
  };

  final response = await   Dio().postUri(Uri.parse(API_URL+'verify_ref_id'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'})
  );
  print(response);
  return response;

}