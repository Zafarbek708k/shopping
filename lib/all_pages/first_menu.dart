import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shopping/all_pages/accaunt_screen.dart';
import 'package:shopping/all_pages/basket_screen.dart';
import 'package:shopping/all_pages/liked_products_screen.dart';
import 'main_screen.dart';


class FirstMenu extends StatefulWidget {
  const FirstMenu({super.key});
  static const String id = "/first_page";

  @override
  State<FirstMenu> createState() => _FirstMenuState();
}

class _FirstMenuState extends State<FirstMenu> {

 final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
 List<Widget> _buildScreens() {
   return [
      MainScreen(),
      LikedProducts(),
      BasketScreen(),
      MyAccauntSetting(),
   ];
 }


 List<PersistentBottomNavBarItem> _navBarsItems() {
   return [
     PersistentBottomNavBarItem(
       icon: const Icon(CupertinoIcons.home, color: Colors.black,),
       title: ("Home"),
       textStyle: const TextStyle(color: Colors.black),
       activeColorPrimary: CupertinoColors.white,
       inactiveColorPrimary: CupertinoColors.systemGrey,
     ),
     PersistentBottomNavBarItem(
       icon: const Icon(CupertinoIcons.heart, color: Colors.black,),
       title: ("Liked"),
       textStyle: const TextStyle(color: Colors.black),
       activeColorPrimary: CupertinoColors.white,
       inactiveColorPrimary: CupertinoColors.systemGrey,
     ),
     PersistentBottomNavBarItem(
       icon: const Icon(CupertinoIcons.cart_badge_plus, color: Colors.black,),
       title: ("Basket"),
       textStyle: const TextStyle(color: Colors.black),
       activeColorPrimary: CupertinoColors.white,
       inactiveColorPrimary: CupertinoColors.systemGrey,
     ),
     PersistentBottomNavBarItem(
       icon: const Icon(CupertinoIcons.person, color:  Colors.black,),
       title: ("Account"),
       textStyle: const TextStyle(color: Colors.black),
       activeColorPrimary: CupertinoColors.white,
       inactiveColorPrimary: CupertinoColors.systemGrey,
     ),
   ];
 }

 @override
 Widget build(BuildContext context) {
   return PersistentTabView(
     context,
     controller: _controller,
     screens: _buildScreens(),
     items: _navBarsItems(),
     confineInSafeArea: true,
     backgroundColor: const Color.fromARGB(255, 70, 162, 155),
     handleAndroidBackButtonPress: true,
     resizeToAvoidBottomInset: true,
     stateManagement: true,
     hideNavigationBarWhenKeyboardShows: true,
     decoration: NavBarDecoration(
       border: Border.all(color: Colors.black), // Add black border
       adjustScreenBottomPaddingOnCurve: true,
       borderRadius: BorderRadius.circular(25.0),
       colorBehindNavBar: Colors.black,
     ),
     popAllScreensOnTapOfSelectedTab: true,
     popActionScreens: PopActionScreensType.all,
     itemAnimationProperties: const ItemAnimationProperties(
       duration: Duration(milliseconds: 200),
       curve: Curves.ease,
     ),
     screenTransitionAnimation: const ScreenTransitionAnimation(
       animateTabTransition: true,
       curve: Curves.ease,
       duration: Duration(milliseconds: 200),
     ),
     navBarStyle: NavBarStyle.style1,
   );
 }

}
