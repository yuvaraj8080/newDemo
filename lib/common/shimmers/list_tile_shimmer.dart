import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/shimmer_circular_Indicator/shimmer.dart';

class TCategoryBrandShimmer extends StatelessWidget {
  const TCategoryBrandShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(8.0),
      child:  Column(
          children: [
        TShimmerEffect(width: double.infinity, height: 50, radius: 50),
        SizedBox(height: TSizes.spaceBtwItems16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TShimmerEffect(width: 100, height:80),
            SizedBox(width: TSizes.spaceBtwItems16 / 2),
            TShimmerEffect(width: 80, height:80),
            SizedBox(width: TSizes.spaceBtwItems16 / 2),
            TShimmerEffect(width: 80, height: 80),
          ],
        )
      ]),
    );
  }
}
