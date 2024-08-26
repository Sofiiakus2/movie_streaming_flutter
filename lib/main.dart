import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_sctreaming/theme/theme.dart';

import 'bottom_navigation_bar/bottom_nav_bar.dart';
import 'film_serial_pages/film_page/film_page.dart';
import 'home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        "/film": (context) => const FilmPage(),
      },
    );
  }
}
