import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/utils/constants/image_string.dart';
import 'package:oru_ecommerce_app/data/service/authentication/authentication-repository.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationRepository());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TImages.oruApp, width: 150), // Replace with your splash image
            SizedBox(height:100),
            Text('Welcome to OruPhones',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}