import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/Authentication/login_controller.dart';

import 'package:oru_ecommerce_app/utils/constants/colors.dart';

import '../../../../utils/validators/validator.dart';



class MobileNumberBottomSheet extends StatelessWidget {
  
  final controller = Get.put(LoginController());
  MobileNumberBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder, as this widget is not directly built
  }

  void mobileNumberSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        child: SingleChildScrollView(
          child:
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Signup to continue",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 24),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height:30),

                  // Phone Number Input Label
                   Text(
                    'Enter Your Phone Number',
                    style:TextStyle(fontSize:14)
                  ),
                  Form(
                    key: controller.mobileFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: controller.mobileNumber,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              // labelText: 'Enter Your Phone Number',

                              hintText: '+91  Mobile Number',
                            ),
                            keyboardType: TextInputType.phone,
                          ),

                          const SizedBox(height:40),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.mobileFormKey.currentState!.validate()) {
                                  controller.requestSheetOtp(context);
                                  Get.back();
                                }
                              },
                              child: const Text("Confirm Name"),
                            ),
                          ),
                        ],
                      ),
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