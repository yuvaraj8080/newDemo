import 'package:flutter/material.dart';
import '../custom_shapes/container/TRoundedContainer.dart';

class SortFilterList extends StatelessWidget {
  const SortFilterList({
    super.key,
    required this.sortFilterList,
    required this.onSortFilterTap, // Add this parameter
  });

  final List<String> sortFilterList;
  final List<VoidCallback> onSortFilterTap; // List of callbacks

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sortFilterList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 13),
            child: GestureDetector(
              onTap: onSortFilterTap[index], // Call the corresponding callback
              child: TRoundedContainer(
                radius: 8,
                padding: EdgeInsets.all(8),
                showBorder: true,
                child: Center(child: Text(sortFilterList[index], style: Theme.of(context).textTheme.bodySmall)),
              ),
            ),
          );
        },
      ),
    );
  }
}