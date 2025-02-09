import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../data/Model/Product_Model.dart';





class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final brands = <Brand>[].obs; // Dummy brand list
  final products = <ProductModel>[].obs; // Products list

  @override
  void onInit() {
    super.onInit();
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
        products.value = productData.map((item) => ProductModel.fromJson(item)).toList();
      }
    } else {
      // Handle error
      print('Failed to load products');
    }

    isLoading.value = false;
  }

}