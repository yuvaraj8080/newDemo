import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/BottomSheet/mobileNumberBottomSheet.dart';
import '../../../../common/widgets.Login_Signup/Products_cart/icon/t_circular_icon.dart';
import '../../../../data/service/ApiService/authentication_service.dart';
import '../../../controllers/onboarding/like_icon_controller.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(() => TCircularIcon(
      icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
      size: 25,
      color: controller.isFavourite(productId) ? Colors.red : null,
      onPressed: ()async{
        final authService = Get.put(ApiService());
        final isLoggedIn = await authService.isLoggedIn();
        if (!isLoggedIn) {
          MobileNumberBottomSheet().mobileNumberSheet(context);
        } else {
          // User is logged in, toggle the favourite product
          controller.toggleFavouriteProduct(productId);
        }
      },
    ));
  }
}