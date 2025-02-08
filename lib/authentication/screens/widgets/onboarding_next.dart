import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/halpers/helper_function.dart';
import '../../controllers/onboarding/onboardingcontroller.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Positioned(
        right:25,
        bottom:kToolbarHeight,
        child:ElevatedButton(style: ElevatedButton.styleFrom(
            shape:const CircleBorder(),shadowColor:Colors.white,elevation:2 ,
            backgroundColor: dark? TColors.primaryColor : Colors.black),
            onPressed:() => onBordingController.instance.nextPage(),
            child:const Icon(Iconsax.arrow_right_3)));
  }
}
