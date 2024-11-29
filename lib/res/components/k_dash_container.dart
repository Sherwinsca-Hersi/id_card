import 'package:flutter/material.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_text.dart';

class DashContainer extends StatelessWidget {
  const DashContainer({super.key, this.color, this.borderRadius, required this.child});

  final Color? color;
  final BorderRadius? borderRadius;
  final Widget  child;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth*0.90*0.30,
      decoration: BoxDecoration(
        color: color ?? AppColors.dashBgColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: child,
    );

  }
}
