import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Features/controllers/FilterController/FilterController.dart';
import '../../../Features/screens/SortFilterProductScreen/FilterSortScreen.dart';
import '../../../utils/constants/colors.dart';

class FilterBottomSheet extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Divider(),
          Expanded(
            child: Obx(() {
              if (controller.filters.isEmpty) {
                // return Center(child: CircularProgressIndicator()); // Show loading indicator
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildFilterSection('Brand'),
                    _buildFilterSection('Ram'),
                    _buildFilterSection('Storage'),
                    _buildFilterSection('Conditions'),
                    _buildFilterSection('Warranty'),
                    _buildPriceRangeSection(),
                  ],
                ),
              );
            }),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:TextStyle(fontWeight: FontWeight.w700,)),
          Obx(() => Text(controller.getSelectedCount(title) > 0
                ? '${controller.getSelectedCount(title)}'
                : '',
            style: TextStyle(color: Colors.amber),
          )),
        ],
      ),
      children: [
        if (title == 'Brand') _buildSearchBar(),
        ...?controller.filters[title]?.map((value) => _buildCheckboxItem(title, value)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search brand here',
          prefixIcon: Icon(Icons.search, color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String category, String value) {
    return Obx(() => CheckboxListTile(
      title: Text(value),
      value: controller.isSelected(category, value),
      onChanged: (bool? checked) {
        if (checked != null) {
          controller.toggleFilter(category, value);
        }
      },
      activeColor: Colors.amber,
    ));
  }

  Widget _buildPriceRangeSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range'),
          SizedBox(height: 16),
          Obx(() => RangeSlider(
            values: RangeValues(
              controller.currentMinPrice.value,
              controller.currentMaxPrice.value,
            ),
            min: controller.minPrice.value,
            max: controller.maxPrice.value,
            divisions: 100,
            labels: RangeLabels(
              '₹${controller.currentMinPrice.value.toStringAsFixed(0)}',
              '₹${controller.currentMaxPrice.value.toStringAsFixed(0)}',
            ),
            onChanged: (RangeValues values) {
              controller.currentMinPrice.value = values.start;
              controller.currentMaxPrice.value = values.end;
            },
            activeColor: Colors.amber,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text('₹${controller.currentMinPrice.value.toStringAsFixed(0)}')),
              Obx(() => Text('₹${controller.currentMaxPrice.value.toStringAsFixed(0)}')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child:Obx(()=> Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                controller.clearFilters(); // Clear selection
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text(
                "Clear",
                style: TextStyle(color: TColors.secondary),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle apply action
                // Handle apply action
                if (controller.selectedFilters.value.isNotEmpty) {
                  final filterValue = controller.selectedFilters.value;
                  Get.back();
                  // Perform the action based on the selected option
                  Get.to(()=>FilterSortProductScreen(selectedFilters:filterValue,));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.selectedFilters.value.isEmpty
                    ? TColors.grey
                    : Colors.amber,
              ),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
      ),
    );
  }
}