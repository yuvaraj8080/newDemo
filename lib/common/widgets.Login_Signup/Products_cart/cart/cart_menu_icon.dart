// import 'package:ecommerceapp/features/shop/controllers/Cart/cart_controller.dart';
// import 'package:ecommerceapp/utils/halpers/helper_function.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../features/shop/screens/cart/cart.dart';
// import '../../../../utils/constants/colors.dart';
//
// class TCardCounterIcon extends StatelessWidget {
//   const TCardCounterIcon({
//     super.key,
//     this.iconColor,
//     this.countBgColor,
//     this.counterTextColor
//   });
//
//
//   final Color? iconColor, countBgColor, counterTextColor;
//
//   @override
//   Widget build(BuildContext context) {
//
//     /// GET INSTANCE OF THE CART CONTROLLER
//     final controller = Get.put(CartController());
//     final dark = THelperFunction.isDarkMode(context);
//
//     return Stack(children: [
//       IconButton(onPressed: () => Get.to(() => const CartScreen()),
//           icon: Icon(Iconsax.shopping_bag,size:25, color: iconColor)),
//       Positioned(
//           right: 0,
//           child: Container(
//               width: 20,
//               height:20,
//               decoration: BoxDecoration(
//                 color: countBgColor ?? (dark ? TColors.white : TColors.black),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: Obx(() {
//                   return Text(controller.noOfCartItems.value.toString()
//                       , style: Theme
//                           .of(context)
//                           .textTheme
//                           .labelLarge!
//                           .apply(
//                           color: counterTextColor ??
//                               (dark ? TColors.black : TColors.white),
//                           fontSizeFactor: 0.8));
//                 }),
//               )))
//     ]);
//   }
// }
