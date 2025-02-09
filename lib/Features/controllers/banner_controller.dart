import 'dart:convert';
import 'package:http/http.dart' as http;
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
  final String make;
  final String imagePath;

  Brand({required this.make, required this.imagePath});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      make: json['make'],
      imagePath: json['imagePath'],
    );
  }
}

class Product {
  final String id;
  final String title;
  final String thumbnail;
  final double price;
  final double salePrice;
  final String productType;
  final Brand? brand;

  Product({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.salePrice,
    required this.productType,
    this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      salePrice: json['salePrice'].toDouble(),
      productType: json['productType'],
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
    );
  }
}

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  ///---VARIABLE-----
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final banners = <Banner>[].obs; // Dummy banner list
  final featuredCategories = <Category>[].obs; // Dummy category list
  final brands = <Brand>[].obs; // Dummy brand list
  final products = <Product>[].obs; // Products list

  @override
  void onInit() {
    super.onInit();
    _loadDummyBanners();
    _loadDummyCategories();
    fetchBrands();
    fetchProducts();
  }

  /// FETCH BRANDS FROM API
  Future<void> fetchBrands() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('http://40.90.224.241:5000/makeWithImages'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'SUCCESS') {
        final List<dynamic> brandData = data['dataObject'];
        brands.value = brandData.map((item) => Brand(
          make: item['make'],
          imagePath: item['imagePath'],
        )).toList();
      }
    } else {
      // Handle error
      print('Failed to load brands');
    }

    isLoading.value = false;
  }

  /// FETCH PRODUCTS FROM API
  Future<void> fetchProducts() async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('http://40.90.224.241:5000/filter'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "filter": {
          "condition": ["Like New", "Fair"],
          "make": ["Samsung"],
          "storage": ["16 GB", "32 GB"],
          "ram": ["4 GB"],
          "warranty": ["Brand Warranty", "Seller Warranty"],
          "priceRange": [40000, 175000],
          "verified": true,
          "sort": {"price": 1}, // Price Low To High
          "page": 1
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'SUCCESS') {
        final List<dynamic> productData = data['dataObject'];
        products.value = productData.map((item) => Product.fromJson(item)).toList();
      }
    } else {
      // Handle error
      print('Failed to load products');
    }

    isLoading.value = false;
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
        Category(image: 'assets/icons/categories/img_1.png'),
        Category(image: 'assets/icons/categories/img_2.png'),
        Category(image: 'assets/icons/categories/img_3.png'),
        Category(image: 'assets/icons/categories/img_4.png'),
        Category(image: 'assets/icons/categories/img_5.png'),
        Category(image: 'assets/icons/categories/img_6.png'),
        Category(image: 'assets/icons/categories/img_7.png'),
        Category(image: 'assets/icons/categories/img_8.png'),
        Category(image: 'assets/icons/categories/img_9.png'),
        Category(image: 'assets/icons/categories/img_10.png'),
        Category(image: 'assets/icons/categories/img_11.png'),
        Category(image: 'assets/icons/categories/img_12.png'),
        Category(image: 'assets/icons/categories/img_13.png'),
        Category(image: 'assets/icons/categories/img_14.png'),
        Category(image: 'assets/icons/categories/img_15.png'),
      ];
      isLoading.value = false;
    });
  }

  /// UPDATE PAGE NAVIGATION DOTS
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}