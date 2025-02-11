import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../../app.dart'; // Ensure this imports your App class correctly

Future<void> initializeNotification() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'high_importance_channel',
        channelKey: 'high_importance_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic tasks',
        defaultColor: Colors.deepPurple,
        ledColor: Colors.red,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        onlyAlertOnce: true,
        playSound: true,
        criticalAlerts: true,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'high_importance_channel_group',
        channelGroupName: "Group 1",
      )
    ],
    debug: true,
  );

  // Request notification permissions if not already granted
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  // Set notification listeners
  await AwesomeNotifications().setListeners(
    onNotificationCreatedMethod: onNotificationCreatedMethod,
    onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    onActionReceivedMethod: onActionReceivedMethod,
  );
}

Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  final payload = receivedAction.payload ?? {};
  if (payload['TestResult'] == 'true') {
    // App.navigatorKey.currentState?.push(MaterialPageRoute(
    //   builder: (_) => TestScreen(), // Ensure TestScreen is defined
    // ));
  }
}

Future<void> onNotificationCreatedMethod(ReceivedNotification notification) async {
  debugPrint("On Notification Created Method");
}

Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedAction) async {
  debugPrint("On Notification Displayed");
}

Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
  debugPrint("On Notification Dismissed");
}

Future<void> showNotification({
  required String title,
  required String body,
  String? summary,
  Map<String, String>? payload,
  ActionType actionType = ActionType.Default,
  NotificationLayout notificationLayout = NotificationLayout.Default,
  NotificationCategory? category,
  String? bigPicture,
  List<NotificationActionButton>? actionButtons,
  bool scheduled = false,
  int? interval,
}) async {
  assert(!scheduled || (scheduled && interval != null));
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0, // Use a unique ID for each notification
      channelKey: 'high_importance_channel',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: summary,
      category: category,
      payload: payload ?? {'TestResult': 'true'}, // Pass your custom payload here
      bigPicture: bigPicture,
    ),
    actionButtons: actionButtons ?? [
      NotificationActionButton(
        key: 'OPEN_TEST',
        label: 'View Test',
        autoDismissible: true,
      ),
    ],
    schedule: scheduled
        ? NotificationInterval(
      interval: interval,
      timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
      preciseAlarm: true,
    )
        : null,
  );
}