import 'dart:developer';

import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_products.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  AdminServices adminServices = AdminServices();
  List<Product>? productList;
  void goToAddProducts() {
    Navigator.pushNamed(context, AddProducts.routeName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  void deleteProduct(var productId, int index) {
    // adminServices.deleteProduct(context, productData.id!);
    adminServices.deleteProduct(context, productId);
    productList!.remove(index);
    setState(() {});
    fetchAllProducts();
  }

  fetchAllProducts() async {
    productList = await adminServices.getProduct(context);
    print(productList?[0].id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    fetchAllProducts();
    return productList == null
        ? Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: productList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = productList![index];
                  // log(productData.id!);
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(image: productData.images[0]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                          IconButton(
                              onPressed: () {
                                deleteProduct(productData.id, index);
                              },
                              icon: Icon(Icons.delete_outline))
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add a Product',
              onPressed: () => goToAddProducts(),
              child: const Icon(Icons.add),
            ),
          );
  }
}
