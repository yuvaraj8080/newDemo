import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/validators/validator.dart';
import '../login_controller.dart';

class Namescreen extends StatelessWidget {
  const Namescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.restore_from_trash_rounded, size: 25),
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
                  const SizedBox(height: 60),
                  Image(
                    height: 65,
                    image: AssetImage(TImages.oruApp),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Welcome",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: TColors.primaryColor),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Signup to continue",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Form(
                key: controller.nameFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.nameController,
                        validator: (value) => TValidator.validateEmptyText("Name", value),
                        decoration: const InputDecoration(
                          hintText: "Name",
                        ),
                      ),
                      const SizedBox(height: 70),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()
                          {
                            if (controller.nameFormKey.currentState!.validate()) {
                              controller.updateName();
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