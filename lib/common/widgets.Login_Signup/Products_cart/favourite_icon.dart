// import 'package:ecommerceapp/common/widgets.Login_Signup/Products_cart/icon/t_circular_icon.dart';
// import 'package:ecommerceapp/features/shop/controllers/product/favourite_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../utils/constants/colors.dart';
//
// class TFavoriteIcon extends StatelessWidget {
//   const TFavoriteIcon({super.key, required this.productId});
//
//   final String productId;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final controller = Get.put(FavouritesController());
//
//     return Obx(() =>   TCircularIcon(
//         icon:controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,size:25,
//         color:controller.isFavourite(productId)? Colors.red : null,
//         onPressed:()=> controller.toggleFavouriteProduct(productId),
//     ));
//   }
// }
