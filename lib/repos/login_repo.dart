import 'dart:convert';
import 'dart:developer';

import 'package:id_card/api/api.dart';

import '../model/login_response.dart';
import 'package:http/http.dart' as http;

class LoginRepository{


  Future<LoginResponse> login({required String mobile})  async{

        try {
            final response = await http.post(

                Uri.parse("http://idcard.celwiz.com/DEV/gsk_matric/id_login.php"),

                body: jsonEncode(
                  {
                    "mobile_number" : mobile.trim()
                  }
                )
            );

            if(response.statusCode == 200){

              log("LoginRepository if");

              final Map<String,dynamic> data =  jsonDecode(response.body);

              log("$data");

              return LoginResponse.fromJson(data);

            }else{
              log("Login Error");
              throw Exception();
            }

        }catch(e){
          throw Exception(e);
      }
  }
}