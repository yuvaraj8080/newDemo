import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/halpers/helper_function.dart';

class TCircularIcon extends StatelessWidget {
  /// ApiService custom icon widget with a background color
  ///
  /// Properties are:
  /// Container [width]. [height], & [backgroundColor]
  ///
  /// Icon's [size], [color], & [onPressed]
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg24,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunction.isDarkMode(context)
                ? TColors.black.withOpacity(0.7)
                : TColors.white.withOpacity(0.7),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
