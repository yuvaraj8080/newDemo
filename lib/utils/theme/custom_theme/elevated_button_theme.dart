import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();



  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation:0,
      foregroundColor:Colors.white,
      backgroundColor: TColors.primaryColor,
        disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color:TColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle:const TextStyle(fontSize:16, color:Colors.white,fontWeight:FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation:0,
        foregroundColor:Colors.white,
        backgroundColor: TColors.primaryColor,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color:TColors.primaryColor),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle:const TextStyle(fontSize:16, color:Colors.white,fontWeight:FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );
}

