import "dart:ui";

import "package:flutter/material.dart";
import "package:movie_sctreaming/home_page/home_page.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import "../favourite_page/favourite_page.dart";
import "../search_page/search_page.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const SearchPage(),
      const FavouritePage(),
      const Center(child: Text('Profile')),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(-15, 0),
          child: const Icon(Icons.grid_view_rounded),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(-30, 0),
          child: const Icon(Icons.search),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(30, 0),
          child: const Icon(Icons.favorite),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(15, 0),
          child: const Icon(Icons.settings),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(Icons.play_arrow, size: 30,color: Colors.white,),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [

          PersistentTabView(
            navBarHeight: 70,
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            backgroundColor: Theme.of(context).dividerColor,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardAppears: true,
            decoration: NavBarDecoration(
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //
              // ),
            ),
            navBarStyle: NavBarStyle.style11, // Використовуємо стиль 12 для цього вигляду
          ),
        ],
      ),
    );
  }
}
