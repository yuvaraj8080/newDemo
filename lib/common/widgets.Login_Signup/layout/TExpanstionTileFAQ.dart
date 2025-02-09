import 'package:flutter/material.dart';

import '../../../Features/controllers/homeController/ProdcutController.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/halpers/helper_function.dart';

class TExpansionTileFAQ extends StatelessWidget {
  const TExpansionTileFAQ({
    super.key,
    required this.productController,
  });

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productController.FastList.length,
      itemBuilder: (context, index) {
        final faq = productController.FastList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            title: Text(faq.question),
            backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.grey,
            collapsedBackgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(faq.answer),
              ),
            ],
          ),
        );
      },
    );
  }
}
