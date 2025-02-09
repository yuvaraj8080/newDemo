import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/banner_controller.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/images/t_circular_image.dart';
import '../../../../../common/shimmers/category_shimmer.dart';
import '../../../../../common/widgets.Login_Signup/image_text_widget/vertical_image_text.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(HomeController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text("No Category Found", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
        );
      }
      return SizedBox(
        height:120,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: TRoundedContainer(
                radius:100,
                child:Image.asset(category.image),
              ),
            );
          },
        ),
      );
    });
  }
}