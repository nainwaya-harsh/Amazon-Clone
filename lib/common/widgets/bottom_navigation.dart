import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/home/screens/home_screen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  static const String routeName = '/main-home';
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  double bottomwidth = 45;
  List<Widget> _pages = [
    HomeScreen(),
    AccountScreen(),
    CartScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 4,
                          color: _index == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.unselectedNavBarColor)),
                ),
                child: Icon(Icons.home_rounded,
                    size: 30,
                    color: _index == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: 45,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 4,
                          color: _index == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.unselectedNavBarColor)),
                ),
                child: Icon(Icons.perm_contact_cal_sharp,
                    size: 30,
                    color: _index == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomwidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 4,
                          color: _index == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.unselectedNavBarColor)),
                ),
                child: Badge(
                  largeSize: 20,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  label: Text(userCartLen.toString()),
                  child: Icon(Icons.shopping_cart_outlined,
                      size: 30,
                      color: _index == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.unselectedNavBarColor),
                ),
              )),
        ],
        currentIndex: _index,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
      ),
    );
  }
}
