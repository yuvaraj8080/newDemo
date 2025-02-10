
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Features/screens/HomeScreen/widgets/SellScreen.dart';
import '../../../utils/constants/colors.dart';

class CenterFloatingButton extends StatelessWidget {
  const CenterFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width:100,
      margin: EdgeInsets.only(bottom: 20), // Add margin to position it above the bottom
      child: FloatingActionButton(
        onPressed: () {
          Get.to(()=>SellScreen());
        },
        backgroundColor: Colors.black54, // Set background color to black
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Change the shape to rounded rectangle
          side: BorderSide(color:TColors.secondary, width:3), // Yellow border
        ),
        child:Center(child: Text("Sell +",style:Theme.of(context).textTheme.headlineSmall!.copyWith(color:TColors.secondary))), // Change icon color to yellow
      ),
    );
  }
}
