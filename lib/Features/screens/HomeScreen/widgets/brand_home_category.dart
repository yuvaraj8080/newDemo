import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/banner_controller.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';
import '../../../../../common/shimmers/category_shimmer.dart';


class TBrandHomeCategory extends StatelessWidget {
  const TBrandHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(HomeController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.brands.isEmpty) {
        return Center(
          child: Text("No Brand Found", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
        );
      }
      return SizedBox(
        height:70,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.brands.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.brands[index];
            return Padding(
              padding: const EdgeInsets.only(right:20),
              child: TRoundedContainer(
                radius:100,
                backgroundColor:TColors.grey,
                child:Image.asset(category.image),
              ),
            );
          },
        ),
      );
    });
  }
}