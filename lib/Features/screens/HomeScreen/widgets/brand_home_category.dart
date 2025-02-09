import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/shimmers/category_shimmer.dart';
import '../../../../../common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/banner_controller.dart';

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
        height: 70,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.brands.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final brand = categoryController.brands[index];
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TRoundedContainer(
                radius: 100,
                backgroundColor: TColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(brand.imagePath,width:50,fit:BoxFit.contain),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}