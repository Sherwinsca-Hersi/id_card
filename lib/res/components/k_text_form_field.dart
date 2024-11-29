import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_card/res/Colors.dart';


class MyTextFormField extends StatelessWidget {
  const MyTextFormField({super.key, required this.hintText, this.labelText, this.prefixIcon, this.suffixIcon, this.borderRadius, this.borderWidth, this.fontSize, this.fontWeight, this.color, required this.controller, this.keyboardType, required this.textInputAction, this.maxLength});

  final String hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final double? borderWidth;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final int? maxLength;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength)
      ],
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          borderSide: BorderSide(
            width: borderWidth ?? 1.5,
            color: AppColors.inputBorderColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(
              width: borderWidth ?? 1.5,
              color: AppColors.focusBorderColor,
            )
        ),
      ),
    );
  }
}



