import 'dart:developer';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:linkat_center_dashboard/core/services/coud_messaging.dart';
import 'package:linkat_center_dashboard/core/utils/app_images.dart';
import 'package:linkat_center_dashboard/firebase_options.dart';
import 'package:linkat_center_dashboard/generated/l10n.dart';
import 'package:linkat_center_dashboard/view/home_view.dart';
import 'package:screen_go/screen_go.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //
  runApp(const MyApp());

  await FirebaseNotification().intilizeNotification();
  //
  await FirebaseNotification().handelBackGround();
  //
  await FirebaseNotification().sendAdminTokenToFireBase();
  //
  log("send successfuly");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // Arabic
        // Locale('en'), // English (add if needed)
      ],
      locale: const Locale('ar'), // Set locale to Arabic
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      title: 'Linkat Smart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        primarySwatch: Colors.amber,
        useMaterial3: true,
        fontFamily: "Cairo",
      ),
      home: ScreenGo(
        materialApp: true,
        builder: (context, deviceInfo) => AnimatedSplashScreen(
          duration: 2000,
          backgroundColor: Colors.white,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesLogoSmart,
                width: 160,
                fit: BoxFit.fill,
              ),
            ],
          ),
          nextScreen: const HomeView(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
