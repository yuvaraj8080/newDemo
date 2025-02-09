import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/widgets/login_form.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/widgets/login_header.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../utils/halpers/helper_function.dart';


class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
      appBar:TAppBar(
        actions:[
          IconButton(onPressed:(){}, icon:Icon(Icons.restore_from_trash_rounded,size:25,))
        ],
      ),
        body: SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
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




