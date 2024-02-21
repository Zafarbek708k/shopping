import 'package:flutter/material.dart';

import '../widgets/custom_driwer.dart';

class LikedProducts extends StatefulWidget {
  const LikedProducts({super.key});

  @override
  State<LikedProducts> createState() => _LikedProductsState();
}

class _LikedProductsState extends State<LikedProducts> {
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
            border: InputBorder.none,
          ),
        )
            : const Text("Like"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: _isSearchVisible ? const Icon(Icons.close) : const Icon(Icons.search),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer:   CustomDrawer(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("BackButton "),
              Text("CRUD "),
            ],
          ),
        ),
      ),
    );
  }
}
