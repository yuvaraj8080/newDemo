// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerceapp/features/shop/models/brand_model.dart';
// import 'package:ecommerceapp/features/shop/screens/brand/brand_products.dart';
// import 'package:ecommerceapp/utils/shimmer_circular_Indicator/shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/halpers/helper_function.dart';
// import '../../../utils/shimmer_circular_Indicator/shimmer.dart';
// import '../Products_cart/TBrandCard.dart';
// import '../custom_shapes/container/TRoundedContainer.dart';
//
//
// class TBrandShowcase extends StatelessWidget {
//   const TBrandShowcase({
//     super.key, required this.images, required this.brand,
//   });
//
//
//   final BrandModel brand;
//   final List<String> images;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.only(left:10,right:10,top:20),
//       child: GestureDetector(
//
//         onTap:()=> Get.to(()=> BrandProducts(brand:brand,title:brand.name)),
//
//         child: TRoundedContainer(
//             radius:15,
//             showBorder:true,
//             borderColor:THelperFunction.isDarkMode(context)?TColors.light: TColors.darkGrey,
//             backgroundColor: Colors.transparent,
//             padding:const EdgeInsets.all(10),
//
//             child: Column(
//                 children:[
//               ///------BRAND WITH PRODUCT COUNT -------
//                TBrandCard(showBorder:false, brand:brand),
//
//               ///---- BRAND TOP 3 PRODUCT IMAGE
//               Row(children: images.map((image) => brandTopProductImageWidget(image,context)).toList())
//             ])
//         ),
//       ),
//     );
//   }
//
//   Widget brandTopProductImageWidget(String image, context){
//     return Expanded(
//         child: TRoundedContainer(
//           height: 80, padding: const EdgeInsets.all(6),
//           margin:const EdgeInsets.all(6),
//           backgroundColor: THelperFunction.isDarkMode(context)? TColors.darkGrey : TColors.light, radius:16,
//           child: CachedNetworkImage(
//             fit:BoxFit.contain,
//             imageUrl: image,
//             progressIndicatorBuilder: (context,url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
//             errorWidget:(context,url,error) => const Icon(Icons.error),
//           )
//         )
//     );
//   }
// }
//
//
//
