import 'package:flutter/material.dart';

import '../widgets/custom_driwer.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor : const Color.fromARGB(255, 40, 162, 155),
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
            : const Text("Basket", style:  TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: _isSearchVisible ? const Icon(Icons.close, color: Colors.black,) : const Icon(Icons.search, color: Colors.black,),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0, // Remove the default shadow
        // Wrap AppBar with Container to add border
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
      ),


      drawer:   CustomDrawer(),

      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CRUD"),
            ],
          ),
        ),
      ),
    );
  }
}
