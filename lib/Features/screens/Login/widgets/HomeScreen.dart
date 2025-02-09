import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/widgets/promo_slider.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import 'package:oru_ecommerce_app/utils/constants/image_string.dart';
import 'package:oru_ecommerce_app/utils/validators/validator.dart';

import '../../../../utils/constants/colors.dart';
import '../login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController = Get.put(LoginController());

    List<String> names = ["Sell Used Phone", "Buy Used Phone", "Compare Price", "My Profile", "My Listing", "Services", "Register your Store", "Get the App"];

    return Scaffold(
      appBar: TAppBar(
        leadingIcon: Icons.list,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(TImages.oruApp, width: 50),
            Row(
              children: [
                Text("India ", style: Theme.of(context).textTheme.bodyMedium),
                Icon(Icons.location_on_outlined)
              ],
            ),
          ],
        ),
        actions: [
          Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: TColors.homeButtonColor,
            ),
            child: Center(child: Text("Login")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              TextFormField(
                // controller: controller.mobileNumber,
                validator: (value) => TValidator.validateEmptyText("Name", value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: TColors.homeButtonColor,
                  hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  hintText: 'Search phone with make, model..',
                  suffixIcon: Icon(Icons.mic_none_outlined),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TRoundedContainer(
                        radius: 8,
                        padding: EdgeInsets.all(8),
                        showBorder: true,
                        child: Center(child: Text(names[index], style: Theme.of(context).textTheme.labelLarge)),
                      ),
                    );
                  },
                ),
              ),


              //// PROMO BANNER SLIDER HAR /////
              const SizedBox(height:16),
              TPromoSlider(),

              //// WHATS ON YOUR MIND ///
              const SizedBox(height:16),
              Text("What's on your mind?", style: Theme.of(context).textTheme.titleSmall),

            ],
          ),
        ),
      ),
    );
  }
}