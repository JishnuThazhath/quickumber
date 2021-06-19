import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, color: Colors.grey,),
            label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.grey),
            label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.grey),
            label: "Account"),
        BottomNavigationBarItem(icon: Icon(Icons.more, color: Colors.grey),
            label: "More"),
      ],
    );
  }

}