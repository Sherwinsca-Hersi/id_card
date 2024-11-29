import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:id_card/repos/login_repo.dart';
import 'package:id_card/utils/toasts.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../views/home_screen.dart';

class LoginProvider with ChangeNotifier{

  final LoginRepository _loginRepo =  LoginRepository();
  bool _isLoading = false;
  bool _isError = false;



  bool get isLoading => _isLoading;
  bool get isError => _isError;

  RoundedLoadingButtonController roundedLoadingButtonController = RoundedLoadingButtonController();
  var timer;

  Future <void> login({required BuildContext context,required String mobile}) async{

    try {


      _isLoading = true;
      notifyListeners();

      final response = await  _loginRepo.login(mobile: mobile);

      log("error: ${response}");

      if(response.responseCode == 200){


        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

        Toast.showSnackbar(
            context: context,
            text: "Login Successful",
        );

      }else{

        Toast.showSnackbar(
          context: context,
          text: "Invalid Mobile No.",
          backgroundColor: Colors.redAccent
        );

      }

    }catch(e){

        throw Exception(e);
    }
    finally{
      _isLoading = false;
      notifyListeners();
      roundedLoadingButtonController.reset();
    }
  }

}