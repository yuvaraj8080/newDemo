import 'package:get/get.dart';

class SortController extends GetxController {
  final selectedOption = RxString('');

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

  void clearSelection() {
    selectedOption.value = '';
  }
}