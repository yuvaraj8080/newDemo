import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/shimmer_circular_Indicator/shimmer.dart';

class TBoxShimmer extends StatelessWidget {
  const TBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children:[
      Expanded(child:TShimmerEffect(width:150, height: 110)),
      SizedBox(width:TSizes.spaceBtwItems16),
      Expanded(child:TShimmerEffect(width:150, height: 110)),
      SizedBox(width:TSizes.spaceBtwItems16),
      Expanded(child:TShimmerEffect(width:150, height: 110)),
    ]);
  }
}
