import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oru_ecommerce_app/Features/screens/HomeScreen/HomeScreen.dart';
import 'package:oru_ecommerce_app/Features/screens/Login/widgets/NameScreen.dart';
import '../ApiService/authentication_service.dart';


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
    _requestNotificationPermissions();
  }

  void _checkAuthentication() async {
    final authService = Get.put(ApiService());
    final isLoggedIn = await authService.isLoggedIn();

    if (isLoggedIn) {
      final isNameUpdated = await authService.isNameUpdated();
      if (isNameUpdated){
        Get.off(() => const HomeScreen());
      } else {
        Get.off(() => const Namescreen());
      }
    }else{
      Get.off(()=>const HomeScreen());
    }
  }


  Future<void> _requestNotificationPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User denied permission');
    }
  }

}