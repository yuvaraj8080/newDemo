// import 'package:ecommerceapp/common/widgets.Login_Signup/Products_cart/favourite_icon.dart';
// import 'package:ecommerceapp/features/shop/controllers/product/product_controller.dart';
// import 'package:ecommerceapp/features/shop/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../add_to_cart_item.dart';
// import '../../../../features/shop/screens/product_details/product_detail.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/enums_dart.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/halpers/helper_functions.dart';
// import '../../custom_shapes/container/TRoundedContainer.dart';
// import '../../images/t_Rounded_image.dart';
// import '../../texts/product_title_text.dart';
// import '../../texts/t_brand_title_and_verify.dart';
// import '../icon/t_circular_icon.dart';
// import '../product_price_text.dart';
//
// class TProductCardHorizontal extends StatelessWidget {
//   const TProductCardHorizontal({super.key, required this.product});
//
//   final ProductModel product;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final dark = THelperFunctions.isDarkMode(context);
//     final controller = Get.put(ProductController());
//     final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
//
//     return GestureDetector(
//       onTap: () => Get.to(() => ProductDetailScreen(product: product)),
//       child: Container(
//         width: 310,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.black : TColors.light,
//         ),
//         child: Row(
//           children: [
//             /// Thumbnail
//             TRoundedContainer(
//               height: 120,
//               padding: const EdgeInsets.all(10),
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               radius: 40,  // correct radius hare if any problem
//               child: Stack(
//                 children: [
//                   /// -- Thumbnail Image
//                    SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: TRoundedImage(
//                       isNetworkImage: true,
//                       imageUlr:product.thumbnail,  //  add image hare
//                       applyImageRadius: true,
//                     ),
//                   ),
//
//
//                   /// SALE PERCENTAGE TAG
//                   if(salePercentage != null)
//                   Positioned(
//                     top:-3,left:-3,
//                     child: TRoundedContainer(
//                       radius: TSizes.sm8,
//                       backgroundColor: TColors.secondary.withOpacity(0.8),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: TSizes.sm8, vertical: TSizes.xs4),
//                       child: Text('$salePercentage%',
//                         style: Theme.of(context).textTheme.labelLarge!.apply(
//                               color: TColors.black,
//                             ),
//                       ),
//                     ),
//                   ),
//
//                   /// -- Favorite Icon Button
//                    Positioned(
//                     top:-10,
//                     right:-6,
//                     child: TFavoriteIcon(productId:product.id)
//                   ),
//                 ],
//               ),
//             ),
//
//             /// Details
//             SizedBox(
//               width: 170,
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TProductTitleText(title: product.title,smallSize: true,),
//                         const SizedBox(height:TSizes.xs4),
//                          TBrandTitleWithVerifiedIcon(title:product.brand!.name,icon:Icons.verified),
//                       ],
//                     ),
//
//                     const Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           child: Column(
//                             crossAxisAlignment:CrossAxisAlignment.start,
//                             children: [
//                               if (product.productType == ProductType.single.toString() && product.salePrice > 0)
//                                 Text(product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.apply(decoration:TextDecoration.lineThrough)
//                                 ),
//
//                               /// PRICE OF THE PRODUCT AS MAIN PRICE IF SAFE EXIST
//                               TProductPriceText(price: controller.getProductPrice(product)),
//                             ],
//                           ),
//                         ),
//
//                         /// ADD TO CAR FEATURES
//                         Container(
//                           decoration:const  BoxDecoration(
//                             color:TColors.primaryColor,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10),
//                             ),
//                           ),
//
//                           ////  PRODUCT CART ADD TO CART BUTTON ICRESING COUANT
//                           child: ProductCardAddToCartButton(product: product),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
