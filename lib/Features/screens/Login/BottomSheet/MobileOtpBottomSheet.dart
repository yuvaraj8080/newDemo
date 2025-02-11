import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/Authentication/login_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/constants/colors.dart';


class MobileOtpBottomSheet extends StatelessWidget {

  final controller = Get.put(LoginController());
  MobileOtpBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }



  onInit() async {
    controller.otpController.dispose();
  }

  void mobileOtpSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Verify Otp',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF1D1B20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height:20),
                // Phone Number Input Label
                Text(
                  "Please Enter the 4 digit verification code sent to your mobile number +91 8080737803 via sms",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height:10),

                // Phone Number Input Field
                Form(
                  child: Column(
                    children: [
                      PinCodeTextField(
                        controller: controller.otpController,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight:50,
                          fieldWidth:50,
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
                      const SizedBox(height:10),
                      Text(
                        "Didn't receive OTP?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Resend OTP in 0:23 Sec",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.validateOtpSheet(context);
                            Get.back();
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
      ),
    );
  }


}