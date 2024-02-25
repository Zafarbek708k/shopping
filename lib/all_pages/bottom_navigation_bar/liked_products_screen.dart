
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping/services/real_time_database_service.dart';

import '../../models/post_model.dart';
import '../../widgets/custom_driwer.dart';

class LikedProducts extends StatefulWidget {
  const LikedProducts({Key? key}) : super(key: key);
  static const String id = "/liked_products";

  @override
  State<LikedProducts> createState() => _LikedProductsState();
}

class _LikedProductsState extends State<LikedProducts> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> create(String path)async{
    PostModel postModel = PostModel(title: _titleController.text.trim().toString(), desc: _descriptionController.text.trim().toString(), createdTime: DateTime.now().toIso8601String());
    await RealTimeDataBaseService.storeData(data: postModel.toJson(), path: path);
    _titleController.clear();
    _descriptionController.clear();
    log("Finished");
  }




  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
                          child: TextField(

                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              prefixIcon: const Icon(Icons.notes_outlined, color: Colors.black,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                          child: TextField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: const Icon(Icons.note_alt_outlined, color: Colors.black,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: ()async{
                      await create("products");
                    },
                    icon: const Icon(Icons.add),

                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.red,
                      )),
                    ),
                  ),
                ],
              ),



              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index){
                    return const Card(
                      child: ListTile(
                        title: Text("title"),
                        subtitle: Text("subtitle"),
                        trailing: Text("trailing"),
                      ),
                    );
                  },
                ),
              ),


            ],
          ),
        ),
      );

  }
}