import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../data/Model/FAQ_Model.dart';
import '../../../data/Model/Product_Model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final brands = <Brand>[].obs; // Dummy brand list
  final products = <ProductModel>[].obs; // Products list
  final FastList = <FaqModel>[].obs; // FAQs list

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
    fetchProducts();
    fetchFaqs();
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
  Future<void> fetchProducts({String? sortOption, Map<String, dynamic>? filters}) async {
    final url = Uri.parse("http://40.90.224.241:5000/filter");

    final Map<String, dynamic> requestBody = {
      "filter": {
        "condition": filters?['condition'] ?? [],
        "make": filters?['make'] ?? [],
        "storage": filters?['storage'] ?? [],
        "ram": filters?['ram'] ?? [],
        "warranty": filters?['warranty'] ?? [],
        "priceRange": filters?['priceRange'] ?? [],
        "verified": filters?['verified'] ?? false,
        "sort": sortOption != null ? { "sortOption": sortOption } : {},
        "page": 1
      }
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> data = responseData['data']['data'];

        // Convert JSON response to a list of ProductModel objects
        products.value = data.map((item) => ProductModel.fromJson(item)).toList();

        print("Products fetched successfully!");
      } else {
        print("Failed to fetch products: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  /// FETCH FAQs FROM API
  Future<void> fetchFaqs() async {
    try {
      final response = await http.get(Uri.parse("http://40.90.224.241:5000/faq"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> faqList = data['FAQs'];
        FastList.value = faqList.map((json) => FaqModel.fromJson(json)).toList();

        print("FAQs fetched successfully!");
      } else {
        throw Exception("Failed to load FAQs");
      }
    } catch (e) {
      print("Error fetching FAQs: $e");
    }
  }

}