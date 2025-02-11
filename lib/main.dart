import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/service/authentication/authentication-repository.dart';
import 'firebase_options.dart';


Future<void> main() async {


  ///---WIDGET BINDING
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();


  ///----AWAIT SPLASH UNTIL ITEM LOAD----
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///----INITIALIZATION FIREBASE AND AUTHENTICATION REPOSITORY----
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );


  runApp(const App());
}