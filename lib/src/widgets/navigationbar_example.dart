import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';
import 'package:test_tag/src/widgets/buttons/tag_button.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item.dart';
import 'package:test_tag/src/widgets/tag_number/tag_number.dart';

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
          child: Column(
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
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
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
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: TagItem(),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: TagNumber()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TagButton(
                      textFirstLine: 'Faulty',
                      color: Colors.red,
                      width: 0.1,
                      onTap: () => {}),
                  TagButton(
                      textFirstLine: 'Next',
                      textSecondLine: "location",
                      color: Colors.grey,
                      width: 0.1,
                      onTap: () => {}),
                  TagButton(
                      textFirstLine: 'Pass',
                      color: Colors.green,
                      width: 0.4,
                      onTap: () => {}),
                ],
              )
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
