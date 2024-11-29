import 'dart:convert';
import 'dart:developer';

import 'package:id_card/api/api.dart';
import 'package:id_card/model/dashboard_response.dart';

import '../model/login_response.dart';
import 'package:http/http.dart' as http;

class DashboardRepository{


  Future<DashboardResponse> getDashData()  async{

    try {
      final response = await http.post(

          Uri.parse("${ApiUrls.dashData}"),

      );

      if(response.statusCode == 200){

        log("DashboardRepository if");

        final Map<String,dynamic> data =  jsonDecode(response.body);

        log("$data");

        return DashboardResponse.fromJson(data);

      }else{
        log("Login Error");
        throw Exception();
      }

    }catch(e){
      throw Exception(e);
    }
  }
}