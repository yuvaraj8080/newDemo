import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';

import '../../../../utils/constants/image_string.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:60),
          Image(
        height:65,
        image: AssetImage(TImages.oruApp),
      ),
      const SizedBox(height:50),
      Text(
        "Welcome",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:TColors.primaryColor)
      ),
          Text(
              "Sign in to continue",
              style: Theme.of(context).textTheme.bodySmall
          ),
    ]);
  }
}
