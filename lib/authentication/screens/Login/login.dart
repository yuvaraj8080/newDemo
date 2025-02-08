import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/login_form.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/login_header.dart';

import '../../../utils/halpers/helper_function.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);



    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 56, left: 20, right: 20, bottom: 20),
        child: Column(children: [
          ///  Logo title And Subtitle,
          TLoginHeader(dark: dark),

          /// Form TextField
          const TLoginForm(),


        ]),
      ),
    ));
  }
}




