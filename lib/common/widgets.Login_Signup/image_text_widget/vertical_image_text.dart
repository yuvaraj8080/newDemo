import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/halpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  final String image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const TVerticalImageText({
    super.key,
    required this.image,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.spaceBtwItems16),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(TSizes.sm8),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child:
                CachedNetworkImage(
                    imageUrl:image.isNotEmpty ? image :image,fit:BoxFit.cover
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
