import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/authentication/screens/signup.widgets/signup_form.dart';
import '../../../../utils/halpers/helper_function.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar:AppBar(),
      body: SingleChildScrollView(
          child:Padding(
            padding:const EdgeInsets.all(20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                /// Title
                Text("Lets create your account",style:Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height:24),

                /// Form TextField hare
                TSignupForm(dark: dark),
                const SizedBox(height:10),
                /// Divider
              ]
            )
          )
      ),
    );
  }
}

