import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets.Login_Signup/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets.Login_Signup/images/t_Rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/shimmer_circular_Indicator/shimmer.dart';
import '../../../controllers/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController()); // Initialize your controller properly
    return Obx(() {
      /// LOADER
      if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 140);

      if (controller.banners.isEmpty) {
        return const Center(child: Text("No Banner Found"));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners.map((banner) => Padding(
                padding: const EdgeInsets.only(right:15),
                child: TRoundedImage(
                  imageUlr: banner.imageUrl.isNotEmpty ? banner.imageUrl : TImages.defaultImage,
                  isNetworkImage:false,
                ),
              )).toList(),
              options: CarouselOptions(

                height:150,
                onPageChanged: (index, _) => controller.updatePageIndicator(index),
              ),
            ),
            const SizedBox(height: TSizes.md16),
            Center(
              child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircularContainer(
                      width: 6,
                      height:6,
                      margin: const EdgeInsets.only(right: 8),
                      backgroundColor:
                      controller.carousalCurrentIndex.value == i
                          ? TColors.primaryColor
                          : TColors.grey,
                    )
                ],
              )),
            )
          ],
        );
      }
    });
  }
}