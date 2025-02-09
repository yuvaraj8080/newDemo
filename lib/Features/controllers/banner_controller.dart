import 'package:get/get.dart';

class Banner {
  final String imageUrl;

  Banner({required this.imageUrl});
}

class Category {
  final String image;

  Category({required this.image});
}

class Brand {
  final String image;

  Brand({required this.image});
}

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  ///---VARIABLE-----
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final banners = <Banner>[].obs; // Dummy banner list
  final featuredCategories = <Category>[].obs; // Dummy category list
  final brands = <Brand>[].obs; // Dummy brand list



  @override
  void onInit() {
    super.onInit();
    _loadDummyBanners();
    _loadDummyCategories();
    _loadDummyBrands();
  }

  /// LOAD DUMMY BRANDS
  void _loadDummyBrands() {
    isLoading.value = true;

    // Simulate a network call with a delay
    Future.delayed(Duration(seconds: 1), () {
      brands.value = [
        Brand(image: 'assets/icons/brands/img.png'),
        Brand(image: 'assets/icons/brands/img_8.png'),
        Brand(image: 'assets/icons/brands/img_2.png'),
        Brand(image: 'assets/icons/brands/img_3.png'),
        Brand(image: 'assets/icons/brands/img_4.png'),
        Brand(image: 'assets/icons/brands/img_5.png'),
        Brand(image: 'assets/icons/brands/img_6.png'),
        Brand(image: 'assets/icons/brands/img_7.png'),
      ];
      isLoading.value = false;
    });
  }

  /// LOAD DUMMY BANNERS
  void _loadDummyBanners() {
    isLoading.value = true;

    // Simulate a network call with a delay
    Future.delayed(Duration(seconds: 1), () {
      banners.value = [
        Banner(imageUrl: 'assets/images/banners/img.png'),
        Banner(imageUrl: 'assets/images/banners/img_1.png'),
        Banner(imageUrl: 'assets/images/banners/img_2.png'),
        Banner(imageUrl: 'assets/images/banners/img_3.png'),
        Banner(imageUrl: 'assets/images/banners/img_5.png'),
      ];
      isLoading.value = false;
    });
  }

  /// LOAD DUMMY CATEGORIES
  void _loadDummyCategories() {
    isLoading.value = true;

    // Simulate a network call with a delay
    Future.delayed(Duration(seconds: 1), () {
      featuredCategories.value = [
        Category(image: 'assets/icons/categories/img.png'),
        Category(image: 'assets/icons/categories/img_1.png' ),
        Category(image: 'assets/icons/categories/img_2.png' ),
        Category(image: 'assets/icons/categories/img_3.png'),
        Category(image: 'assets/icons/categories/img_4.png' ),
        Category(image: 'assets/icons/categories/img_5.png' ),
        Category(image: 'assets/icons/categories/img_6.png' ),
        Category(image: 'assets/icons/categories/img_7.png' ),
        Category(image: 'assets/icons/categories/img_8.png' ),
        Category(image: 'assets/icons/categories/img_9.png' ),
        Category(image: 'assets/icons/categories/img_10.png' ),
        Category(image: 'assets/icons/categories/img_11.png' ),
        Category(image: 'assets/icons/categories/img_12.png' ),
        Category(image: 'assets/icons/categories/img_13.png' ),
        Category(image: 'assets/icons/categories/img_14.png'),
        Category(image: 'assets/icons/categories/img_15.png' ),
      ];
      isLoading.value = false;
    });

  }



  /// UPDATE PAGE NAVIGATION DOTS
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}