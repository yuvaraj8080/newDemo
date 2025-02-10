import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Features/controllers/FilterController/FilterController.dart';

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
          Text(title),
          Obx(() => Text(
            controller.getSelectedCount(title) > 0
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
          hintText: 'Search here',
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
      child: Row(
        children: [
          TextButton(
            onPressed: controller.clearFilters,
            child: Text(
              'Clear All',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          Spacer(),

          Expanded(
            child: ElevatedButton(
              onPressed: controller.applyFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}