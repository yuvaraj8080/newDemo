import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/Authentication/login_controller.dart';

import '../../../../utils/validators/validator.dart';




class MobileNamebottomSheet extends StatelessWidget {

  final controller = Get.put(LoginController());
  MobileNamebottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder, as this widget is not directly built
  }

  void mobileNameSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign in to continue',
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
              const SizedBox(height:10),

              // Phone Number Input Label
              const Text(
                'Please Tell us Your Name',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1D1B20),
                ),
              ),
              const SizedBox(height:20),
              Form(
                key: controller.nameFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:25),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: controller.nameController,
                        validator: (value) => TValidator.validateEmptyText("Name", value),
                        decoration: const InputDecoration(
                          hintText: "Name",
                        ),
                      ),
                      const SizedBox(height:40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.nameFormKey.currentState!.validate()) {
                              controller.updateNameSheet(context);
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
    );
  }


}