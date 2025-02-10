import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/validators/validator.dart';

class SearchATextFormField extends StatelessWidget {
  const SearchATextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => TValidator.validateEmptyText("Name", value),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        prefixIconColor: TColors.homeButtonColor,
        hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        hintText: 'Search phone with make, model..',
        suffixIcon: Icon(Icons.mic_none_outlined),
      ),
    );
  }
}