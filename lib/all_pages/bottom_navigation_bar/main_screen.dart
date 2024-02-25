import 'package:flutter/material.dart';
import 'package:shopping/services/network_service.dart';
import '../../models/product_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<Products> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = getProducts();
  }

  Future<Products> getProducts() async {
    String resultData =
    await NetworkService.getAllData(NetworkService.baseApi);
    return productsFromJson(resultData);
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Products>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.products.length,
                        itemBuilder: (context, index) {
                          final product = snapshot.data!.products[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0), // Adjust the radius as needed
                                        topRight: Radius.circular(10.0), // Adjust the radius as needed
                                      ),
                                      child: AspectRatio(
                                        aspectRatio: 9 / 9, // Aspect ratio for the image
                                        child: Image.network(
                                          product.thumbnail,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.title,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(product.description),
                                          Text('Cost: \$${product.price}'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      // Add your like button functionality here
                                    },
                                    icon: const Icon(Icons.favorite_border),
                                    color: Colors.red, // Adjust color as needed
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      // Add your basket button functionality here
                                    },
                                    icon: const Icon(Icons.shopping_basket),
                                    color: Colors.blue, // Adjust color as needed
                                  ),
                                ),
                              ],
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
        },
      );
  }
}
