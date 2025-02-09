import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';

import '../../controllers/Authentication/login_controller.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {

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