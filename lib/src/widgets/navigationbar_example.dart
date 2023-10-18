import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class NavigationBarExample extends StatefulWidget {
  const NavigationBarExample({super.key});

  @override
  State<NavigationBarExample> createState() => _NavigationBarExampleState();
}

class _NavigationBarExampleState extends State<NavigationBarExample> {
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
      label: 'Search',
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
    return Scaffold(
      appBar: AppBar(
        title: Text(destinationArray[currentPageIndex].label),
        toolbarHeight: 50,
      ),
      bottomNavigationBar: NavigationBar(
          height: 70,
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
        Container(
          width: double.infinity,
          color: Colors.green,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 8),
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          'Tag Preview',
                        )),
                    Card(
                        child: SizedBox(
                      width: double.infinity,
                      // margin:
                      //     const EdgeInsetsDirectional.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          const Text('ID: 1400058 ~ 1400060'),
                          Text('Items: $item x 3'),
                          const Text('Location: NW143'),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              const Text('Item')
            ],
          ),
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
