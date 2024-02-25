import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping/services/cloud_firestore_service.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<Map<String, dynamic>> _basketData = [];

  @override
  void initState() {
    super.initState();
    _fetchBasketData();
  }

  void _fetchBasketData() async {
    try {
      List<Map<String, dynamic>> data = await CloudFireStoreService.readData(
        collectionPath: 'Note',
      );
      setState(() {
        _basketData = data;
      });
    } catch (e) {
      log('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
    );
  }
}
