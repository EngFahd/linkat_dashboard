import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  // admin tcoken
  final firebaseMessagin = FirebaseMessaging.instance;
//
  String? token;

  CollectionReference adminTocken =
      FirebaseFirestore.instance.collection('adminTokens');

  sendAdminTokenToFireBase() async {
    //
    // await intilizeNotification();
    //
    adminTocken
        .doc('admin1')
        .set({
          'token': token,
        })
        .then(
          (value) => log(" admin token send "),
        )
        .catchError(
          (error) => log("Failed to add user: $error"),
        );
  }

  // create instanse

  //intilize notification
  Future<void> intilizeNotification() async {
    await firebaseMessagin.requestPermission();
    token = await firebaseMessagin.getToken();
    log("$token");
  }

  // handel notification
  void handelMassage(RemoteMessage? remotemess) {
    log("\n==================\n");
    print(remotemess);
    // navigatorKey.currentState
    //     ?.pushNamed(HomeView.routeName, arguments: remotemess);
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return HomePage();
    //   },
    // ));
  }

  // hande notification back greound
  Future<void> handelBackGround() async {
    firebaseMessagin.getInitialMessage().then(handelMassage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMassage);
  }
}

myRequest() async {
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
    print('User declined or has not accepted permission');
  }
}
