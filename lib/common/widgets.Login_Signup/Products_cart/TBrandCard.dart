// import 'package:ecommerceapp/common/shimmers/brand_shimmer.dart';
// import 'package:ecommerceapp/features/shop/controllers/brand_controller.dart';
// import 'package:ecommerceapp/utils/shimmer_circular_Indicator/shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../features/shop/models/brand_model.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/enums_dart.dart';
// import '../../../utils/halpers/helper_function.dart';
// import '../images/t_circular_image.dart';
// import '../texts/t_brand_title_and_verify.dart';
//
//
// class TBrandCard extends StatelessWidget {
//   const TBrandCard({
//     super.key,
//     this.showBorder = true,
//     this.onTap,
//     required this.brand,
//   });
//
//   final BrandModel brand;
//   final bool showBorder;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     final brandController = Get.put(BrandController());
//
//     return FutureBuilder(
//       future: brandController.getTotalProductStockForBrand(brandId: brand.id),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final totalStock = snapshot.data;
//           return GestureDetector(
//             onTap: onTap,
//             child: Container(
//               height: 65,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: showBorder
//                     ? Border.all(
//                     color: THelperFunction.isDarkMode(context)
//                         ? TColors.light
//                         : TColors.darkGrey)
//                     : null,
//               ),
//               child: Row(
//                 children: [
//                   Flexible(
//                     child: TCircularImage(
//                       isNetworkImage: true,
//                       fit: BoxFit.cover,
//                       backgroundColor: Colors.transparent,
//                       image: brand.image,
//                       width: 65,
//                       height: 65,
//                     ),
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TBrandTitleWithVerifiedIcon(
//                         title: brand.name,
//                         brandTextSize: TextSizes.medium,
//                         icon: Iconsax.verify,
//                       ),
//                       Text(
//                         "$totalStock Items",
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme.of(context).textTheme.labelMedium,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }