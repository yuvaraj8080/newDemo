import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets.Login_Signup/images/t_Rounded_image.dart';
import '../../../../common/widgets.Login_Signup/texts/product_title_text.dart';
import '../../../../data/Model/Product_Model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/halpers/helper_function.dart';
import 'FavLikeIcon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);


    return Card(
      elevation:1,
      shadowColor: dark ? Colors.white : Colors.black,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: dark ? TColors.dark : TColors.light,
          ),
          child: Column(
            children: [
              Container(
                width:double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: TRoundedImage(
                        height:130,
                        backgroundColor: Colors.transparent,
                        imageUlr: product.defaultImage.fullImage,
                        applyImageRadius: true,
                        isNetworkImage: true,fit:BoxFit.cover,
                      ),
                    ),
                    // Favorite Icon Button
                    Positioned(
                      top: -3,
                      right: -8,
                      child:  IconButton(
                        onPressed: () {},
                        icon: TFavoriteIcon(productId: product.id),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded( // Make the attributes below the image flexible
                child: Padding(
                  padding: const EdgeInsets.only(left:4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: TSizes.sm8),
                      // Product Title
                      TProductTitleText(title: product.marketingName,smallSize: true),
                      const SizedBox(height:8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${product.deviceRam}/${product.deviceStorage} •",style: Theme.of(context).textTheme.labelMedium),
                          Text("${product.deviceCondition}",style: Theme.of(context).textTheme.labelMedium)
                        ],
                      ),
                      const SizedBox(height: TSizes.xs4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("₹ ${product.discountedPrice}",style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(width: TSizes.sm8),

                          Text(" ${product.originalPrice}",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough, // Adds a cross line
                              decorationThickness: 2, // Optional: Adjust thickness
                            ),
                          )
                        ],
                      ),
                      // Price and Button
                    ],
                  ),
                ),
              ),
              Container(
                  height:25,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
                      color:dark ? TColors.darkGrey : TColors.grey,
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${product.listingState}${product.listingLocation}",style:TextStyle(fontSize:8)),
                      Text("${product.verifiedDate}",style:TextStyle(fontSize:8))
                    ],
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}