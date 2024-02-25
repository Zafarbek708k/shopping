import 'package:flutter/material.dart';
import 'package:shopping/all_pages/bottom_navigation_bar/accaunt_screen.dart';
import 'package:shopping/all_pages/bottom_navigation_bar/basket_screen.dart';
import 'package:shopping/all_pages/bottom_navigation_bar/liked_products_screen.dart';
import 'package:shopping/widgets/custom_driwer.dart';
import 'bottom_navigation_bar/main_screen.dart';

class FirstMenu extends StatefulWidget {
  const FirstMenu({Key? key}) : super(key: key);

  @override
  State<FirstMenu> createState() => _FirstMenuState();
}

class _FirstMenuState extends State<FirstMenu> {
  int _selectedIndex = 0;
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _screens = [
    const MainScreen(),
    const LikedProducts(),
    const BasketScreen(),
    const MyAccountSetting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 162, 155),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 162, 155),
        title: _isSearchVisible
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20),
            border: InputBorder.none,
          ),
        )
            : const Text("Ecommerce", style:  TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: _isSearchVisible
                ? const Icon(Icons.close, color: Colors.black,)
                : const Icon(Icons.search, color: Colors.black,),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
      ),

      drawer: const CustomDrawer(),

      body: _screens[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          border: Border.all(color: Colors.black),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent, // Set background color here
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.white70,
          onTap: _onItemTapped,
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Basket',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
