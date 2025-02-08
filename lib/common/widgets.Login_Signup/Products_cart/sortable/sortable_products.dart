// import 'package:ecommerceapp/features/shop/controllers/all_products_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../features/shop/models/product_model.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../layout/grid_layout.dart';
// import '../product_cards/product_card_vetical.dart';
//
// class TSortableProducts extends StatelessWidget {
//   const TSortableProducts({
//     super.key, required this.products,
//   });
//
//   final List<ProductModel> products;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final controller = Get.put(AllProductController());
//     controller.assignProducts(products);
//
//     return Column(
//       children: [
//         /// Dropdown
//         DropdownButtonFormField(
//           items: [
//             'Name','Higher Price','Lower price','Sale Product','New Product', 'Popularity'].map((option) =>
//                   DropdownMenuItem(value: option, child: Text(option)))
//               .toList(),
//           onChanged: (value) {
//             ///  SORT PRODUCTS BASED ON THE SELECTED OPTION
//                   controller.sortProducts(value!);
//             },
//           decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//           value:controller.selectedSortOption.value,
//         ),
//         const SizedBox(height: TSizes.spaceBtwItems16),
//
//         /// Products
//         Obx(()=>
//             TGridLayout(
//             itemCount:controller.products.length,
//             itemBuilder: (_, index) =>  TProductCardVertical(product:controller.products[index]),
//           ),
//         ),
//       ],
//     );
//   }
// }
