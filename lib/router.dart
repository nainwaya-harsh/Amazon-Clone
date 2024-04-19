import 'package:amazon_clone/common/widgets/bottom_navigation.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/admin/screens/add_products.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/order_details/order_details.dart';
import 'package:amazon_clone/features/product_details/screen/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/home/screens/category_deals.dart';
import 'package:amazon_clone/home/screens/home_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import 'models/orders.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomNavigation.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AddProducts.routeName:
      return MaterialPageRoute(builder: (_) => const AddProducts());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(builder: (_) => CategoryDealsScreen(category: category));
    case SearchScreen.routeName:
      var query = routeSettings.arguments as String;
      return MaterialPageRoute(builder: (_) => SearchScreen(query: query));
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product));
    case AddressScreen.routeName:
    var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(builder: (_) => AddressScreen(totalAmount: totalAmount,));
    case OrderDetailScreen.routeName:
     var order = routeSettings.arguments as Order;
      return MaterialPageRoute(builder: (_) => OrderDetailScreen(order: order));
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Error 404 no page found'),
                ),
              ));
  }
}
