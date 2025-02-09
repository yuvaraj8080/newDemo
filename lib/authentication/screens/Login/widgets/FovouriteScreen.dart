import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/login_controller.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/mobileNumber.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController = Get.put(LoginController());

    return Scaffold(
      appBar: TAppBar(
        actions: [

        ],
      ),
      body: Center(
        child: Text("LikeScreen Screen"),
      ),
    );
  }
}