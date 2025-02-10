import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/HomeScreen.dart';
import 'package:oru_ecommerce_app/data/repositories/ApiService/authentication_service.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///---VARIABLES----
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // GET AUTHENTICATED USER DATA
  User? get authUser => _auth.currentUser;

  /// CALLED FROM MAIN DART ON APP LAUNCH
  @override
  void onReady() {
    // REMOVE THE NATIVE SPLASH SCREEN
    FlutterNativeSplash.remove();
    // REDIRECT TO THE APPROPRIATE SCREEN
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    final authService = Get.put(ApiService());
    final isLoggedIn = await authService.isLoggedIn();

    if (isLoggedIn) {
      final isNameUpdated = await authService.isNameUpdated();
      if (isNameUpdated) {
        Get.off(() => const HomeScreen());
      } else {
        Get.off(() => const HomeScreen());
      }
    }else{
      Get.off(()=>const HomeScreen());
    }
  }
}