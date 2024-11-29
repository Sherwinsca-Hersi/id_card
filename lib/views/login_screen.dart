import 'package:flutter/material.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_common_container.dart';
import 'package:id_card/res/components/k_text.dart';
import 'package:id_card/utils/toasts.dart';
import 'package:id_card/view_model/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../res/components/k_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<LoginProvider>(builder: (context, loginProvider, _) {
      return Scaffold(
        body: CommonContainer(
          image: 'assets/images/login_vector.jpg',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.90,
                child: Column(
                  children: [
                    MyText(
                      text: "Welcome Back",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontBlack,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: MyText(
                        text: "Login to your account",
                        fontSize: 15,
                        color: AppColors.fontBlack,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.90,
                      height: screenHeight * 0.10,
                      child: MyTextFormField(
                        controller: mobileController,
                        hintText: 'Mobile No',
                        color: Colors.grey,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLength: 10,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.95,
                      child: RoundedLoadingButton(
                        color: AppColors.primary,
                        width: screenWidth,
                        borderRadius: 12,
                        controller: loginProvider.roundedLoadingButtonController,
                        onPressed: () {
                          if(mobileController.text.length == 10 && mobileController.text !='') {
                              loginProvider.login(context: context, mobile: mobileController.text);
                          }
                          else{
                            loginProvider.roundedLoadingButtonController.reset();
                             Toast.showSnackbar(
                               context: context,
                               text: "Mobile Number is invalid!!",
                               backgroundColor: Colors.redAccent,
                             );
                          }
                        },
                        child: MyText(
                          text: "LOGIN",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
