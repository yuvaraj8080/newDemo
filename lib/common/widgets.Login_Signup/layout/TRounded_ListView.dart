import 'package:flutter/material.dart';

import '../custom_shapes/container/TRoundedContainer.dart';

class TScrollableListView extends StatelessWidget {
  const TScrollableListView({
    super.key,
    required this.names,
  });

  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TRoundedContainer(
              radius: 8,
              padding: EdgeInsets.all(8),
              showBorder: true,
              child: Center(child: Text(names[index], style: Theme.of(context).textTheme.labelLarge)),
            ),
          );
        },
      ),
    );
  }
}