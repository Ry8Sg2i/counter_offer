import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color:Colors.black),
            label: 'Main'
          ),
          BottomNavigationBarItem(
            icon: Icon(
            Icons.account_box,
            color:Colors.black),
            label: 'Account'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
            color:Colors.black),
            label: 'Setting'
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/main')) {
      return 0;
    }
    if (location.startsWith('/account')) {
      return 1;
    }
    if (location.startsWith('/setting')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/main');
        break;
      case 1:
        GoRouter.of(context).go('/account');
        break;
      case 2:
        GoRouter.of(context).go('/setting');
        break;
    }
  }
}