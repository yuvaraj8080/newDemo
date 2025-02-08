import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/shimmer_circular_Indicator/shimmer.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: TSizes.spaceBtwItems16),
      height:120,child:
      ListView.separated(
        itemCount:itemCount,
        shrinkWrap:true,
        scrollDirection:Axis.horizontal,
        separatorBuilder:(context, index) => const SizedBox(width:TSizes.spaceBtwItems16),
        itemBuilder:(_,__) => const Row(
          mainAxisSize:MainAxisSize.min,
        children:[

          ///IMAGE
          TShimmerEffect(width:100, height:100),
          SizedBox(width:TSizes.spaceBtwItems16),

          ///TEXT
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children:[
              SizedBox(height:TSizes.spaceBtwSections32),
              TShimmerEffect(width: 100, height: 12),
              SizedBox(height:TSizes.spaceBtwItems16/2),
              TShimmerEffect(width: 100, height: 12),
              SizedBox(height:TSizes.spaceBtwItems16/2),
              TShimmerEffect(width: 100, height: 12),
              Spacer()
            ]
          )
        ]
      )
      )
    );
  }
}
