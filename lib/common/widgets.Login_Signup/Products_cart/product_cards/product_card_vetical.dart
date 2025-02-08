// import 'package:ecommerceapp/common/widgets.Login_Signup/Products_cart/favourite_icon.dart';
// import 'package:ecommerceapp/common/widgets.Login_Signup/Products_cart/product_price_text.dart';
// import 'package:ecommerceapp/features/shop/controllers/product/product_controller.dart';
// import 'package:ecommerceapp/utils/constants/enums_dart.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../add_to_cart_item.dart';
// import '../../../../features/shop/models/product_model.dart';
// import '../../../../features/shop/screens/product_details/product_detail.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/halpers/helper_function.dart';
// import '../../images/t_Rounded_image.dart';
// import '../../texts/product_title_text.dart';
// import '../../../shadow.dart';
// import '../../texts/t_brand_title_and_verify.dart';
//
// class TProductCardVertical extends StatelessWidget {
//   const TProductCardVertical({super.key, required this.product});
//
//   final ProductModel product;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProductController());
//     final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
//     final dark = THelperFunction.isDarkMode(context);
//
//     return Card(
//       elevation: 3,
//       shadowColor: dark ? Colors.white : Colors.black,
//       child: GestureDetector(
//         onTap: () => Get.to(() => ProductDetailScreen(product: product)),
//         child: Container(
//           padding: const EdgeInsets.all(2),
//           decoration: BoxDecoration(
//             boxShadow: [TShadowStyle.VerticalProductShadow],
//             borderRadius: BorderRadius.circular(16),
//             color: dark ? TColors.dark : TColors.light,
//           ),
//           child: Column(
//             children: [
//               Container(
//                 height: 150, // Fixed image height
//                 padding: const EdgeInsets.all(10),
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: TRoundedImage(
//                         backgroundColor:Colors.transparent,
//                         imageUlr: product.thumbnail,
//                         applyImageRadius: true,
//                         isNetworkImage: true,
//                       ),
//                     ),
//                     // Sale Tag on the Product
//                     if (salePercentage != null)
//                       Positioned(
//                         left: -1,
//                         top: -1,
//                         child: Container(
//                           height: 30,
//                           decoration: BoxDecoration(
//                             color: Colors.yellow.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           padding: const EdgeInsets.all(4),
//                           child: Text(
//                             '$salePercentage%',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodySmall!
//                                 .apply(color: TColors.black),
//                           ),
//                         ),
//                       ),
//                     // Favorite Icon Button
//                     Positioned(
//                       top: -15,
//                       right: -10,
//                       child: IconButton(
//                         onPressed: () {},
//                         icon: TFavoriteIcon(productId: product.id),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded( // Make the attributes below the image flexible
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TProductTitleText(title: product.title, smallSize: true),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           TBrandTitleWithVerifiedIcon(
//                             title: product.brand?.name ?? '',
//                           ),
//                           const Icon(Iconsax.verify, color: TColors.primaryColor, size: 15),
//                         ],
//                       ),
//                       const SizedBox(height: TSizes.sm8),
//                       // Price and Button
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if (product.productType == ProductType.single.toString() && product.salePrice > 0)
//                                   Text(
//                                     "₹${product.price.toString()}",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall!
//                                         .apply(decoration: TextDecoration.lineThrough),
//                                   ),
//                                 // Main Product Price
//                                 TProductPriceText(price: controller.getProductPrice(product),isLarge:product.productType == ProductType.single.toString() ? true : false),
//                               ],
//                             ),
//                           ),
//                           // Add to Cart Button
//                           ProductCardAddToCartButton(product: product),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
