import 'package:flutter/cupertino.dart';

import '../../utils/shimmer_circular_Indicator/shimmer.dart';
import '../widgets.Login_Signup/layout/grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget{
  const TVerticalProductShimmer({
    super.key,
    this.itemCount =8,
});

  final int itemCount;
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TGridLayout(
          itemCount: itemCount,
          mainAxisExtent:180,
          itemBuilder:(_,__)=> const SizedBox(
            width:180,
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.center,
                children:[
                  //// IMAGE
                  TShimmerEffect(width: 170, height:180),
            ])
          )),
    );
  }
}