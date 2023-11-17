import 'package:chaussure/utils/constants.dart';
import 'package:chaussure/view/bag/bag.dart';
import 'package:chaussure/view/user_profiel/user_profile_view.dart';
import 'package:chaussure/view/view.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // *************
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      _selectedIndex,
      curve: Curves.easeInCubic,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  final List<Widget> _screens = [
    const HomeView(),
    const BagView(),
    const UserProfileView(),
  ];
  // *************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),

      // ******** Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 27,
        selectedFontSize: 28,
        backgroundColor: AppConstantsColor.backgroundColor,
        selectedItemColor: AppConstantsColor.materialButtonColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
        ],
      ),
    );
  }
}
