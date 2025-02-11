import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oru_ecommerce_app/Features/screens/SortFilterProductScreen/FilterSortScreen.dart';
import 'package:oru_ecommerce_app/utils/constants/colors.dart';

import '../../../Features/controllers/SortAndFilterController.dart';

class SortBottomSheet extends StatelessWidget {
  final SortController controller = Get.put(SortController());

  SortBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder, as this widget is not directly built
  }

  void showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sort',
                    style: TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              _buildSortOption('Value For Money'),
              _buildSortOption('Price: High To Low'),
              _buildSortOption('Price: Low To High'),
              _buildSortOption('Latest'),
              _buildSortOption('Distance'),
              const SizedBox(height: 10),
              Obx(()=> Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.clearSelection(); // Clear selection
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
                          if (controller.selectedOption.value.isNotEmpty) {
                            final sortValue = controller.selectedOption.value;
                            Navigator.pop(context);
                            // Perform the action based on the selected option
                            Get.to(()=>FilterSortProductScreen(sortOption:sortValue));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.selectedOption.value.isEmpty
                              ? TColors.grey
                              : Colors.amber,
                        ),
                        child: const Text("Apply"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSortOption(String option) {
    return Obx(
          () => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          option,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey[300]!,
              width: 2,
            ),
            color: controller.selectedOption.value == option
                ? Colors.amber
                : Colors.transparent,
          ),
        ),
        onTap: () => controller.setSelectedOption(option),
      ),
    );
  }
}