import 'package:flutter/material.dart';

class AppBarComponentWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponentWidget({required this.title, super.key});
  final String title;

  @override
  Size get preferredSize {return const Size(double.infinity, 60.0);}
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: Container(
          height: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
