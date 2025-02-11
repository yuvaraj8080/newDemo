import 'package:flutter/material.dart';
import '../widgets.Login_Signup/Choice/filterBottomSheet.dart';
import '../widgets.Login_Signup/Choice/sortBottomSheet.dart';

class PhoneMarketplace {
  final List<String> names = [
    "Sell Used Phone",
    "Buy Used Phone",
    "Compare Price",
    "My Profile",
    "My Listing",
    "Services",
    "Register your Store",
    "Get the App"
  ];

  final List<String> sortFilterList = [
    "⬆⬇ Sort ",
    " ☰  Filter  ",
    "Nearby Deals",
    "Deals in 250km",
    "Verified Deals",
    "   Apple   ",
    "Samsung",
    "Under Warranty"
  ];

  // Define the actions for each sort/filter option
// Define the actions for each sort/filter option
  void Function(String) sortFilterActions(BuildContext context) {
    return (selectedOption) {
      switch (selectedOption) {
        case "⬆⬇ Sort ":
          SortBottomSheet().showSortBottomSheet(context);
          break;
        case " ☰  Filter  ":
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => FilterBottomSheet(),
          );
          break;
        case "Nearby Deals":
          print("Nearby Deals selected");
          // Implement your logic here
          break;
        case "Deals in 250km":
          print("Deals in 250km selected");
          // Implement your logic here
          break;
        case "Verified Deals":
          print("Verified Deals selected");
          // Implement your logic here
          break;
        case "Apple":
          print("Apple selected");
          // Implement your logic here
          break;
        case "Samsung":
          print("Samsung selected");
          // Implement your logic here
          break;
        case "Under Warranty":
          print("Under Warranty selected");
          // Implement your logic here
          break;
        default:
          print("Unknown option selected");
      }
    };
  }
}
