// import 'package:ecommerceapp/features/shop/models/cart_item_models.dart';
// import 'package:flutter/material.dart';
// import '../../../../utils/constants/enums_dart.dart';
// import '../../images/t_Rounded_image.dart';
// import '../../texts/product_title_text.dart';
// import '../../texts/t_brand_title_and_verify.dart';
// class TCartItem extends StatelessWidget {
//   const TCartItem({
//     super.key, required this.cartItem,
//   });
//
//   final CartItemModel cartItem;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Row(
//         children:[
//           ///----IMAGE----
//           TRoundedImage(imageUlr:cartItem.image??'',
//             isNetworkImage:true,
//             width:90, height:90,
//             padding:const EdgeInsets.all(8),
//             // backgroundColor: dark ? TColors.darkGrey : TColors.light,
//           ),
//           const SizedBox(width:30),
//
//           ///----TITLE PRICE & SIZE
//           Column(
//               mainAxisSize:MainAxisSize.min,
//               crossAxisAlignment:CrossAxisAlignment.start,
//               children:[
//                  TBrandTitleWithVerifiedIcon(title:cartItem.brandName??'',brandTextSize: TextSizes.small,icon:Icons.verified,),
//                  Flexible(child: TProductTitleText(title:cartItem.title,maxLine:1,smallSize: true)),
//
//                 ///---- ATTRIBUTES-----
//                 Text.rich(
//                     TextSpan(children:(cartItem.selectedVariation ??{})
//                             .entries.map((e)=> TextSpan(
//                           children:[
//                             TextSpan(text:e.key,style:Theme.of(context).textTheme.bodySmall),
//                             TextSpan(text:e.value,style:Theme.of(context).textTheme.bodyLarge),
//                           ]
//                         )).toList(),
//                     )
//                 )
//               ])
//         ]
//     );
//   }
// }
