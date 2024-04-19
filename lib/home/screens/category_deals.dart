import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/product_details/screen/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../services/fetch_products.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices _homeServices = new HomeServices();
  List<Product>? categoryProducts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    categoryProducts = await _homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    categoryProducts?.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep Shopping For ${widget.category}',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          categoryProducts == null
              ? Loader()
              : SizedBox(
                  height: 170,
                  child: GridView.builder(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: categoryProducts!.length,
                      itemBuilder: ((context, index) {
                        final productData = categoryProducts![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: productData,
                            );
                          },
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        productData.images[0],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 5,
                                    right: 15,
                                  ),
                                  child: Center(
                                    child: Text(
                                      productData.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                )
        ],
      ),
    );
  }
}
