import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oru_ecommerce_app/Features/controllers/homeController/ProdcutController.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/widgets/TProductCardVertical.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/widgets/advetiseUiDesingn.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/widgets/brand_home_category.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/widgets/home_categories.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/widgets/promo_slider.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/mobileNumber.dart';
import 'package:oru_ecommerce_app/data/repositories/ApiService/authentication_service.dart';
import 'package:oru_ecommerce_app/utils/constants/image_string.dart';
import '../../../common/shimmers/vertical_productShimmer.dart';
import '../../../common/widgets.Login_Signup/Choice/filterBottomSheet.dart';
import '../../../common/widgets.Login_Signup/Choice/sortBottomSheet.dart';
import '../../../common/widgets.Login_Signup/Choice/sortFilterList.dart';
import '../../../common/widgets.Login_Signup/appBar/appbar.dart';
import '../../../common/widgets.Login_Signup/layout/CenterFloatingButton.dart';
import '../../../common/widgets.Login_Signup/layout/TExpanstionTileFAQ.dart';
import '../../../common/widgets.Login_Signup/layout/TRounded_ListView.dart';
import '../../../common/widgets.Login_Signup/layout/grid_layout.dart';
import '../../../common/widgets.Login_Signup/layout/searchTextFormField.dart';
import '../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final apiService = ApiService();

    List<String> names = [
      "Sell Used Phone",
      "Buy Used Phone",
      "Compare Price",
      "My Profile",
      "My Listing",
      "Services",
      "Register your Store",
      "Get the App"
    ];

    List<String> sortFilterList = [
      "⬆⬇ Sort ",
      " ☰  Filter  ",
      "Nearby Deals",
      "Deals in 250km",
      "Verified Deals",
      "   Apple   ",
      "Samsung",
      "Under Warranty"
    ];

    // Define the actions for each sort/filter option
    List<VoidCallback> sortFilterActions = [
          () { SortBottomSheet().showSortBottomSheet(context); },
          () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => FilterBottomSheet(),
        );
      },
          () {},
          () {},
          () {},
          () {},
          () {},
          () {},
    ];

    return Scaffold(
      floatingActionButton: CenterFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: TAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.list, size: 36),
                  onPressed: () {},
                ),
                Image.asset(TImages.oruApp, width: 60),
              ],
            ),
            Row(
              children: [
                Text("India ", style: Theme.of(context).textTheme.bodyMedium),
                Icon(Icons.location_on_outlined)
              ],
            ),
          ],
        ),
        actions: [
          FutureBuilder<bool>(
            future: apiService.isLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return IconButton(
                  icon: Icon(Icons.error),
                  onPressed: () {
                    Get.snackbar('Error', 'Failed to check login status');
                  },
                );
              } else if (snapshot.hasData && snapshot.data == true) {
                return IconButton(
                  icon: Icon(Icons.notifications, size: 25),
                  onPressed: () {
                    Get.snackbar('Notifications', 'You have new notifications');
                  },
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => MobileNumberScreen());
                  },
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: TColors.homeButtonColor,
                    ),
                    child: Center(child: Text("Login")),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchATextFormField(),
                const SizedBox(height: 16),
                TScrollableListView(names: names),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TPromoSlider(),
                    const SizedBox(height: 16),
                    Text("What's on your mind?", style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 8),
                    THomeCategories(),
                    const SizedBox(height: 28),
                    Text("Top Brands", style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 10),
                    TBrandHomeCategory(),
                    const SizedBox(height: 28),
                    Text("Best Deal in India", style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 15),
                    SortFilterList(sortFilterList: sortFilterList, onSortFilterTap: sortFilterActions),
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
                          product: productController.products[index],
                        ),
                        itemCount: productController.products.length,
                      );
                    }),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Frequently Asked Questions", style: Theme.of(context).textTheme.titleMedium),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (productController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (productController.FastList.isEmpty) {
                        return Center(child: Text("No FAQs available"));
                      }
                      return TExpansionTileFAQ(productController: productController);
                    }),
                    const SizedBox(height: 10),
                    // Download App Section
                    AppDownloadSection(context),


                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Or Share',
                        style: TextStyle(
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialIcon(Iconsax.instagram, Colors.pink), // Instagram
                        SizedBox(width: 15),
                        socialIcon(Iconsax.instagram, Colors.blue), // Telegram
                        SizedBox(width: 15),
                        socialIcon(Icons.android, Colors.black), // X (Twitter)
                        SizedBox(width: 15),
                        socialIcon(Iconsax.message, Colors.green), // WhatsApp
                      ],
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget socialIcon(IconData icon, Color color) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      color: Colors.white,
      size: 24,
    ),
  );
}