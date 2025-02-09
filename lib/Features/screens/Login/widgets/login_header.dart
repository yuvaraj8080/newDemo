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
          const SizedBox(height:40),
          Image(height:65,
        image: AssetImage(TImages.oruApp),
      ),
      const SizedBox(height:50),
      Text(
        "Welcome",
        style:TextStyle(fontSize:30,fontWeight:FontWeight.w500,color:TColors.primaryColor)
      ),
          Text("Sign in to continue",
              style: Theme.of(context).textTheme.bodySmall
          ),
    ]);
  }
}
