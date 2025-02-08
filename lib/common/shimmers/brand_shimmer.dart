import 'package:flutter/material.dart';

import '../../utils/shimmer_circular_Indicator/shimmer.dart';
import '../widgets.Login_Signup/layout/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});


  final int itemCount;

  Widget build(BuildContext context){
    return TGridLayout(
        itemCount: itemCount,
        mainAxisExtent:60,
        itemBuilder:(_,__) => const TShimmerEffect(width:80, height: 60)
    );
  }

}