import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/HomeScreen.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart'; // Import the package
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../controllers/Authentication/login_controller.dart';

class Mobileotpscreen extends StatelessWidget {
  const Mobileotpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => HomeScreen());
            },
            icon: Icon(Icons.cancel_outlined, size: 25),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image(
                    height: 65,
                    image: AssetImage(TImages.oruApp),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Verify Mobile No.",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Please Enter the 4 digit verification code sent to your mobile number +91 8080737803 via sms",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    PinCodeTextField(
                      controller: controller.otpController,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 60,
                        inactiveColor: TColors.dark,
                        activeColor: TColors.dark,
                        selectedColor: TColors.dark,

                      ),
                      enableActiveFill: false,
                      onChanged: (value) {
                        // You can handle the value change here if needed
                      },
                      beforeTextPaste: (text) {
                        return true; // Allow pasting
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Didn't receive OTP?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Resend OTP in 0:23 Sec",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 70),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.validateOtp();
                        },
                        child: const Text("Verify OTP"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}