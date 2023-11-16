import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Navbar extends StatelessWidget {
  const Navbar(this.navigationshell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.greenAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home, color:Colors.white), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_box, color:Colors.white), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color:Colors.white), label: 'Setting'),
          ],
          onTap: _ontap,
          type: BottomNavigationBarType.fixed,
        ));
  }
  void _ontap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}