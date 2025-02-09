import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/halpers/helper_function.dart';
class TRoundedContainer extends StatelessWidget {

   TRoundedContainer({super.key,

    this.width,
    this.height,
    this.radius = 30,
    this.child,
     this.showBorder = false,
     this.borderColor =  TColors.grey,
     this.backgroundColor,
    this.padding,
    this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height:height,
      padding: padding,
      margin:margin,
      decoration:BoxDecoration(
        color:dark ? TColors.dark : TColors.light,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child
    );
  }
}
