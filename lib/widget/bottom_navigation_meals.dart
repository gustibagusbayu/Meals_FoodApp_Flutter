import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meals_foodapp/constants/color_constant.dart';
import 'package:meals_foodapp/constants/style_constant.dart';

class BottomNavigationMeals extends StatefulWidget {
  @override
  _BottomNavigationMealsState createState() => _BottomNavigationMealsState();
}

class _BottomNavigationMealsState extends State<BottomNavigationMeals> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: mBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new SvgPicture.asset('assets/icons/home_colored.svg')
                : new SvgPicture.asset('assets/icons/home.svg'),
            title: Text(
              'Home',
              style: mBottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/icons/list_colored.svg')
                : new SvgPicture.asset('assets/icons/list.svg'),
            title: Text(
              'List Order',
              style: mBottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/icons/restaurant_colored.svg')
                : new SvgPicture.asset('assets/icons/restaurant.svg'),
            title: Text(
              'Restaurant',
              style: mBottomTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new SvgPicture.asset('assets/icons/account_colored.svg')
                : new SvgPicture.asset('assets/icons/account.svg'),
            title: Text(
              'Account',
              style: mBottomTextStyle,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mYellowColor,
        unselectedItemColor: mFlatColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
