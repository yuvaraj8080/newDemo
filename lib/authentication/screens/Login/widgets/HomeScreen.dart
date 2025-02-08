import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/login_controller.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/mobileNumber.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController = Get.put(LoginController());

    return Scaffold(
      appBar: TAppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await logoutController.logout();
              Get.offAll(() => const MobileNumberScreen());
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}