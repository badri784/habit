import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/provider/nav_bar_provider.dart';

import '../screens/explore.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/yourstuff.dart';

class NavBar extends ConsumerWidget {
  NavBar({super.key});

  final _screens = <Widget>[
    const Home(),
    const Explore(),
    const MyWidget(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageindex = ref.watch(navBarNotifier);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: pageindex,
        onTap: (int index) {
          ref.read(navBarNotifier.notifier).selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Your Stuff'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _screens[pageindex],
    );
  }
}
