import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/HomeScreen.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/NameScreen.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/mobileOtpScreen.dart';
import 'package:oru_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:oru_ecommerce_app/utils/constants/image_string.dart';
import '../../../data/repositories/ApiService/authentication_service.dart';

class LoginController extends GetxController {
  final apiService = ApiService();
  final mobileNumber = TextEditingController();
  final mobileFormKey = GlobalKey<FormState>();
  final rememberMe = false.obs;
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();

  Future<void> requestOtp() async {
    if (mobileFormKey.currentState!.validate()) {
      TFullScreenLoader.openLoadingDialog("Sending Otp", TImages.loading);
      bool success = await apiService.requestOtp(91, int.parse(mobileNumber.text));
      TFullScreenLoader.stopLoading();
      if (success) {
        Get.to(() => const Mobileotpscreen());
      } else {
        Get.snackbar('Error', 'Failed to send OTP');
      }
    }
  }

  Future<void> validateOtp() async {
    TFullScreenLoader.openLoadingDialog("Verifying Otp", TImages.loading);
    bool success = await apiService.validateOtp(91, int.parse(mobileNumber.text), int.parse(otpController.text));
    TFullScreenLoader.stopLoading();
    if (success) {
      Get.snackbar('Success', 'OTP verified');
      Get.to(() => const Namescreen());
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  Future<void> updateName() async {
    TFullScreenLoader.openLoadingDialog("Updating Name", TImages.loading);
    bool success = await apiService.updateUser(91, nameController.text);
    TFullScreenLoader.stopLoading();
    if (success) {
      Get.snackbar('Success', 'Name updated');
      Get.offAll(() => const HomeScreen());
    } else {
      Get.snackbar('Error', 'Failed to update name');
    }
  }
}