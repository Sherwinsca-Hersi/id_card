import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, required this.image});

  final Widget? child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image),
          fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop)),
        ),
      );
  }
}
