import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/Authentication/login_controller.dart';

import 'package:oru_ecommerce_app/utils/constants/colors.dart';



class MobileNumberBottomSheet extends StatelessWidget {
  
  final controller = Get.put(LoginController());
  MobileNumberBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder, as this widget is not directly built
  }

  void showSortBottomSheet(BuildContext context) {
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
                const SizedBox(height: 24),

                // Phone Number Input Label
                const Text(
                  'Enter Your Phone Number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1D1B20),
                  ),
                ),
                const SizedBox(height: 8),

                // Phone Number Input Field
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '+91',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF49454F),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: controller.mobileNumber,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                              color: Color(0xFF49454F),
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Terms and Conditions Checkbox
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: false,
                        
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, onChanged: (bool? value) {  },
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'I accept the terms and conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.requestOtp();
                },
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text('Next '),
                    Icon(Icons.arrow_forward, color:Colors.white)
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