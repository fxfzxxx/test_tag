import 'package:flutter/material.dart';
import 'package:test_tag/src/screens/tag_screen.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int currentPageIndex = 0;

  String item = 'Default Item';
  final destinationArray = [
    const NavigationDestination(
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: Icon(Icons.search),
      selectedIcon: Icon(Icons.search),
      label: 'Test and Tag',
    ),
    const NavigationDestination(
      icon: Icon(Icons.favorite_border),
      selectedIcon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = AppLayout.getSize(context).height;
    double screenWidth = AppLayout.getSize(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(destinationArray[currentPageIndex].label),
        toolbarHeight: 40,
      ),
      bottomNavigationBar: NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.blue,
          selectedIndex: currentPageIndex,
          destinations: destinationArray),
      body: <Widget>[
        Container(
          color: Colors.red,
          child: const Center(
            child: Text('Home'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TagScreen(),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
            child: Text('Favorites'),
          ),
        ),
        Container(
            color: Colors.yellow,
            child: const Center(
              child: Text('Profile'),
            ))
      ][currentPageIndex],
    );
  }
}
