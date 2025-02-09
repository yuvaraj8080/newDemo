import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';
import 'custom_theme/TChechboxTheme.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottomSheetTheme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_buttond.dart';
import 'custom_theme/text_field_Theme.dart';
import 'custom_theme/text_theme.dart';
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3:true,
        fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor:TColors.primaryColor,
    scaffoldBackgroundColor:Colors.white,
    textTheme:TTextTheme.lightTextTheme,
    chipTheme:TChipTheme.lightChipTheme,
    appBarTheme:TAppbarTheme.lightAppBarTheme,
    checkboxTheme:TCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme:TBottomSheetTheme.ligthBottomSheetTheme,
    elevatedButtonTheme:TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme:TOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme:TTextFieldTheme.lightInputDecorationTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3:true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor:TColors.primaryColor,
    textTheme:TTextTheme.darkTextTheme,
    scaffoldBackgroundColor:Colors.black,
    chipTheme:TChipTheme.darkChiptheme,
    appBarTheme:TAppbarTheme.darkAppBarTheme,
    checkboxTheme:TCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme:TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme:TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme:TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme:TTextFieldTheme.darkInputDecorationTheme,

  );
}