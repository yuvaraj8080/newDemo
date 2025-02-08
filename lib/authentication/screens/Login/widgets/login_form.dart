import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            TextFormField(
              controller: controller.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Enter Your Phone Number',
                prefixText: '+91  ',
                hintText: 'Mobile Number',
              ),
              keyboardType: TextInputType.phone,
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
                const Text('Accept Terms and Condition')
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.requestOtp();
                },
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}