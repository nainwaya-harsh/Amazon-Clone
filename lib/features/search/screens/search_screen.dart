import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/product_details/screen/product_details_screen.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widget/search_product.dart';
import 'package:amazon_clone/home/widgets/address_box.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.popAndPushNamed(context, SearchScreen.routeName,
        arguments: query);
  }

  List<Product>? searchProduct = [];
  final SearchServices _searchServices = SearchServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProductList();
    
  }

  searchProductList() async {
    searchProduct = await _searchServices.getSearchedProducts(
        context: context, searchQuery: widget.query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 15),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          hintText: widget.query,
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1)),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          AddressBox(),
          searchProduct == null
              ? Loader()
              : Expanded(
                  child: ListView.builder(
                      itemCount: searchProduct!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: searchProduct![index],
                            );
                          },
                          child: SearchedProduct(
                            product: searchProduct![index],
                          ),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
