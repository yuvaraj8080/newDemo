import 'package:flutter/material.dart';


import '../../../utils/constants/colors.dart';

import '../../../utils/constants/enums_dart.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.icon,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: brandTextSize == TextSizes.small
              ? Theme.of(context).textTheme.bodySmall!.apply(color: color)
              : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
              ? Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: color)
              : Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: color,overflow:TextOverflow.ellipsis),
        ),
        const SizedBox(width:2),
        Icon(icon, color: TColors.primaryColor, size:15),
      ],
    );
  }
}
