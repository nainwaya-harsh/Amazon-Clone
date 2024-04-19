import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/analytics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _index = 0;
  double bottomwidth = 45;
  List<Widget> _pages = [
    PostScreen(),
   AnalyticsScreen(),
    OrdersScreen()
  ];
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
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Text(
                'Admin',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
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
                child: Icon(Icons.post_add_sharp,
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
                child: Icon(Icons.analytics_outlined,
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
                child: Icon(Icons.shopping_cart_outlined,
                    size: 30,
                    color: _index == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor),
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
