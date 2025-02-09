import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oru_ecommerce_app/authentication/screens/Login/widgets/NameScreen.dart';
import 'package:oru_ecommerce_app/data/repositories/ApiService/authentication_service.dart';

import '../../../authentication/screens/Login/mobileNumber.dart';
import '../../../authentication/screens/Login/widgets/HomeScreen.dart';
import '../../../authentication/screens/onBoarding/onboarding.dart';

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
        Get.off(() => const Namescreen());
      }
    } else {
      // No user is signed in
      deviceStorage.writeIfNull("IsFirstTime", true);

      // Check if it's the first time launching the app
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const MobileNumberScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }
}