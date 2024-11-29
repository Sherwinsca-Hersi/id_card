import 'package:flutter/material.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_text.dart';

class Toast{
  static void showSnackbar({
    required BuildContext context,
    DismissDirection? dismissDirection,
    Color? backgroundColor,
    SnackBarBehavior? snackBarBehavior,
    double? snackBarWidth,
    IconData? icon,
    Color? color,
    FontWeight? fontWeight,
    required String text,
  }
  ){
    var snackBar = SnackBar(
        dismissDirection: dismissDirection ?? DismissDirection.startToEnd,
        backgroundColor: backgroundColor ?? AppColors.primary,
        behavior: snackBarBehavior ?? SnackBarBehavior.floating,
        content: SizedBox(
          width: snackBarWidth ?? 100,
          child: Row(
            children: [
              Icon(
                icon ?? Icons.info,
                color: color ?? Colors.white,
              ),
              MyText(text: text)
            ],
          ),
        )
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}