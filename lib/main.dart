import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_sctreaming/autorization/sign_in_page/sign_in_page.dart';
import 'package:movie_sctreaming/theme/theme.dart';

import 'bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

 // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        "/": (context) => const BottomNavBar(),
        "/sign_in": (context) => const SignInPage(),
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
