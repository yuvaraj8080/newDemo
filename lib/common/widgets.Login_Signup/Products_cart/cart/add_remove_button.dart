import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/halpers/helper_function.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });


  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        ///ADD REMOVE BUTTON
        Row(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Container(
                  width:35,height:35,decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color:THelperFunction.isDarkMode(context) ? TColors.grey : TColors.darkGrey,
                ),
                    child: IconButton(color:Colors.red, onPressed:remove, icon:const Icon(Iconsax.minus,size:20))),

                 const SizedBox(width:10),

                Text(quantity.toString(),style:Theme.of(context).textTheme.titleSmall),

                const SizedBox(width:10),

                 Container(
                     width:35,height:35,decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(30)),
                     color:THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.grey,
                 ),
                     child: IconButton(color: Colors.green, onPressed:add, icon:const Icon(Iconsax.add,size:20))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
