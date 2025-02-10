import 'package:get/get.dart';
import '../../../data/repositories/ApiService/filterApi.dart';

class FilterController extends GetxController {
  final FilterService filterService = FilterService();

  final RxMap<String, List<String>> filters = <String, List<String>>{}.obs;
  final RxMap<String, List<String>> selectedFilters = <String, List<String>>{}.obs;
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 100000.0.obs;
  final RxDouble currentMinPrice = 5000.0.obs;
  final RxDouble currentMaxPrice = 100000.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFilters();
  }

  Future<void> fetchFilters() async {
    try {
      final data = await filterService.fetchFilters();
      filters.value = Map<String, List<String>>.from(data.map((key, value) => MapEntry(key, value as List<String>)));
    } catch (e) {
      print('Error loading filters: $e');
    }
  }

  void toggleFilter(String category, String value) {
    if (!selectedFilters.containsKey(category)) {
      selectedFilters[category] = [];
    }

    if (selectedFilters[category]!.contains(value)) {
      selectedFilters[category]!.remove(value);
    } else {
      selectedFilters[category]!.add(value);
    }
    selectedFilters.refresh();
  }

  void clearFilters() {
    selectedFilters.clear();
    currentMinPrice.value = minPrice.value;
    currentMaxPrice.value = maxPrice.value;
  }

  void applyFilters() {
    // Implement your filter application logic here
    Get.back(result: selectedFilters);
  }

  bool isSelected(String category, String value) {
    return selectedFilters[category]?.contains(value) ?? false;
  }

  int getSelectedCount(String category) {
    return selectedFilters[category]?.length ?? 0;
  }
}