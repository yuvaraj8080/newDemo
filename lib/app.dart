
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/routes/app_routes.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';
import 'package:oru_ecommerce_app/utils/theme/theme.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      themeMode: ThemeMode.system,
      theme:TAppTheme.lightTheme,
      darkTheme:TAppTheme.darkTheme,
      // initialBinding:GeneralBinding(),
      // getPages:AppRoutes.pages,
      home:const Scaffold(backgroundColor:TColors.primaryColor,
          body:Center(child:CircularProgressIndicator(color:Colors.white))),
    );
  }
}
