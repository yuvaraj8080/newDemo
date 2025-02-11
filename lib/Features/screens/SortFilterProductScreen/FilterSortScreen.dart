import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/controllers/homeController/ProdcutController.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/layout/grid_layout.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/layout/searchTextFormField.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/appBar/appbar.dart';
import 'package:oru_ecommerce_app/common/shimmers/vertical_productShimmer.dart';
import 'package:oru_ecommerce_app/common/widgets.Login_Signup/Choice/sortFilterList.dart';
import '../../../common/SortAndFilterArrayList/sortAndFilterArrayList.dart';
import '../HomeScreen/widgets/TProductCardVertical.dart';

class FilterSortProductScreen extends StatelessWidget {
   FilterSortProductScreen({super.key,this.sortOption,  Map<String, List<String>>? selectedFilters});

  String? sortOption;
  List<String>? selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    productController.fetchProducts(sortOption: sortOption);
    final PhoneMarketplace marketplace = PhoneMarketplace();

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Row(
          children: [
            Expanded(child: SearchATextFormField()),
            SizedBox(width : 8),
            Row(
              children: [
                Text("India ", style: Theme.of(context).textTheme.bodyMedium),
                Icon(Icons.location_on_outlined)
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Deal in India", style: Theme.of(context).textTheme.titleSmall),
                  Text("(1354 devices)", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 15),
              SortFilterList(
                sortFilterList: marketplace.sortFilterList,
                onSortFilterTap: marketplace.sortFilterActions(context), // This now returns a single function
              ),
              const SizedBox(height: 25),
              Obx(() {
                if (productController.isLoading.value) {
                  return const TVerticalProductShimmer();
                }
                if (productController.products.isEmpty) {
                  return Center(child: Text("NO Data Found!", style: Theme.of(context).textTheme.bodyLarge));
                }
                return TGridLayout(
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: productController.products[index]),
                  itemCount: productController.products.length,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}