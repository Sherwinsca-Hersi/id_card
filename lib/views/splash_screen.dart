import 'dart:async';

import 'package:flutter/material.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_common_container.dart';
import 'package:id_card/views/login_screen.dart';

import '../res/components/k_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(milliseconds: 5000), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
          child: CommonContainer(
            image: "assets/images/vector_splash.jpg",
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/ic_launcher.png",width: screenWidth*0.60,height: screenHeight*0.40,),
                MyText(text: 'ID CARD',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontBlack,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
