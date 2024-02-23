import 'package:flutter/material.dart';
import 'package:shopping/services/cloud_firestore_service.dart';

import '../widgets/custom_driwer.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _basketData = []; // Holds the fetched data

  @override
  void initState() {
    super.initState();
    _fetchBasketData(); // Call the function to fetch data when screen initializes
  }

  // Function to fetch basket data
  void _fetchBasketData() async {
    try {
      List<Map<String, dynamic>> data = await CloudFireStoreService.readData(
        collectionPath: 'Note', // Specify your collection path here
      );
      setState(() {
        _basketData = data;
      });
    } catch (e) {
      // Handle errors if any
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 162, 155),
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
            : const Text(
          "Basket",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
            icon: _isSearchVisible
                ? const Icon(Icons.close, color: Colors.black)
                : const Icon(Icons.search, color: Colors.black),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0, // Remove the default shadow
        // Wrap AppBar with Container to add border
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView.builder(
            itemCount: _basketData.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(_basketData[index]['title'] ?? ''),
                  subtitle: Text(_basketData[index]['content'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Implement update logic here
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async{
                          await CloudFireStoreService.deleteData(collectionPath: "Note", documentId: "7SEGJwYgo2lPZbwx4Ojt");
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showAddItemDialog();
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Future<void> _showAddItemDialog() async {
    String title = '';
    String content = '';

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Content'),
              onChanged: (value) => content = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final note = <String, dynamic>{
                "title": title,
                "content": content,
                "dataTime": DateTime.now(),
              };

              await CloudFireStoreService.storeData(
                  collectionPath: "Note", data: note);
              setState(() {
                _fetchBasketData();
              });

              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
