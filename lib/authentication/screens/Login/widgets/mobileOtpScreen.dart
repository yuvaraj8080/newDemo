import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/halpers/helper_function.dart';
import '../../../../utils/validators/validator.dart';
import '../login_controller.dart';


class Mobileotpscreen extends StatelessWidget {
  const Mobileotpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Scaffold(
        appBar:TAppBar(
           showBackArrow: true,
          actions:[
            IconButton(onPressed:(){}, icon:Icon(Icons.restore_from_trash_rounded,size:25,))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(top:10, left: 15, right: 15, bottom: 20),
            child: Column(children: [
              ///  Logo title And Subtitle,
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height:60),
                  Image(
                    height:65,
                    image: AssetImage(TImages.mahakal),
                  ),
                  const SizedBox(height:50),
                  Text(
                      "Verify Mobile No.",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:TColors.primaryColor)
                  ),
                  const SizedBox(height:20),

                  Text(
                      "Please Enter the 4 digit  verification code sent to your mobile number +91 8080737803 via sms",
                      style: Theme.of(context).textTheme.bodySmall
                  ),
                ]),

              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height:70),
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => TValidator.validateEmail(value),
                        decoration: const InputDecoration(
                            labelText: "Enter Your Phone Number",
                            prefixText:"+91  " ,
                            hintText:"Mobile Number"
                        ),
                      ),

                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) =>
                            controller.rememberMe.value = !controller.rememberMe.value,
                          )),
                          Text("Accept Terms and Condition")
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Perform email and password sign in
                            // controller.emailAndPasswordSignIn();
                          },
                          child: const Text("Sign In"),
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ]),
          ),
        ));
  }
}




