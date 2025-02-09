import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets.Login_Signup/Products_cart/product_price_text.dart';
import '../../../../common/widgets.Login_Signup/images/t_Rounded_image.dart';
import '../../../../common/widgets.Login_Signup/texts/product_title_text.dart';
import '../../../../common/widgets.Login_Signup/texts/t_brand_title_and_verify.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/halpers/helper_function.dart';
import '../../../controllers/banner_controller.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Card(
      elevation: 3,
      shadowColor: dark ? Colors.white : Colors.black,
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: dark ? TColors.dark : TColors.light,
          ),
          child: Column(
            children: [
              Container(
                height: 150, // Fixed image height
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Center(
                      child: TRoundedImage(
                        backgroundColor: Colors.transparent,
                        imageUlr: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),
                    // Favorite Icon Button
                    Positioned(
                      top: -15,
                      right: -10,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.link),
                        // TFavoriteIcon(productId: product.id),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded( // Make the attributes below the image flexible
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallSize: true),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TBrandTitleWithVerifiedIcon(
                            title: product.brand?.make ?? '',
                          ),
                          const Icon(Iconsax.verify, color: TColors.primaryColor, size: 15),
                        ],
                      ),
                      const SizedBox(height: TSizes.sm8),
                      // Price and Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (product.productType == "single" && product.salePrice > 0)
                                  Text(
                                    "₹${product.price.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(decoration: TextDecoration.lineThrough),
                                  ),
                                // Main Product Price
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}