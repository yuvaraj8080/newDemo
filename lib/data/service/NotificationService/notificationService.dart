import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<NotificationService> init() async {
    // Request permission for notifications
    await _requestPermission();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message when the app is in the foreground
      print('Received a message while in the foreground: ${message.notification?.title}');
      // Show a dialog or a snackbar with the message
      Get.snackbar(message.notification?.title ?? '', message.notification?.body ?? '');
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle messages when the app is opened from a terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked! ${message.notification?.title}');
      // Navigate to a specific screen if needed
    });

    return this;
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User  granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User  granted provisional permission');
    } else {
      print('User  declined or has not accepted permission');
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Handle background messages
    print('Handling a background message: ${message.messageId}');
  }
}