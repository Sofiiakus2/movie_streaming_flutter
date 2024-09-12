import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_sctreaming/splash/splash_screen.dart';
import 'package:movie_sctreaming/theme/theme.dart';

import 'autorization/log_in_page/log_in_page.dart';
import 'bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDta9aQbRJUBiIXuksMJY0a4wHIQhAW_nY',
          appId: '1:259355715309:android:34ad3b1a2963dc58720ee4',
          messagingSenderId: '259355715309',
          projectId: 'movie-streaming-8d839',
          storageBucket: 'movie-streaming-8d839.appspot.com'
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Streaming',
      theme: darkTheme,
      routes: {
        "/":(context)=>const SplashScreen(),
        "/login": (context) => const LogInPage(),
        "/bottomNavBar":(context)=> const BottomNavBar(),
      },

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: const Locale('uk'),

    );
  }
}
