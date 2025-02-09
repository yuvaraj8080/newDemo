import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/shimmers/category_shimmer.dart';
import '../../../../../common/widgets.Login_Signup/custom_shapes/container/TRoundedContainer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/ProdcutController.dart';

class TBrandHomeCategory extends StatelessWidget {
  const TBrandHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Obx(() {
      if (productController.isLoading.value) return const TCategoryShimmer();
      if (productController.brands.isEmpty) {
        return Center(
          child: Text("No Brand Found", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productController.brands.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final brand = productController.brands[index];
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TRoundedContainer(
                radius: 100,
                backgroundColor: TColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(brand.imagePath,width:60,fit:BoxFit.contain),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}