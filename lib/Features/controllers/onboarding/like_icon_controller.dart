import 'dart:convert';
import 'package:get/get.dart';
import '../../../../utils/local_storage/storage_utility.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  /// VARIABLES
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  /// METHOD TO INITIALIZE FAVOURITE BY READING STORAGE
  void initFavourites(){
    final json = TLocalStorage.instance().readData("favourites");
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  /// FAVORITES  PRODUCT TOGGLE IN THE WISHLIST METHOD
  void toggleFavouriteProduct(String productId) {

    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesStorage();
      Get.snackbar('Success', 'Product has been added to the Wishlist');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesStorage();
      favourites.refresh();
      Get.snackbar('Success', 'Product has been removed form the Wishlist');
    }
  }

  /// SAVE FAVOURITES PRODUCT IN THE WISHLIST
  void saveFavouritesStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }
}