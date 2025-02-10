import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

          ],
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
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Container(
          width: 18,
          height: 18,
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