import 'package:flutter/material.dart';
import 'package:counterofferv1/src/screen/register/chat_page.dart';
import 'package:counterofferv1/src/screen/my_page.dart';
import 'package:counterofferv1/src/screen/setting_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const _screens = [
    ChatPage(),
    MyPage(),
    SettingPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}