import 'package:flutter/material.dart';

class AnotherUser extends StatelessWidget {
  const AnotherUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "AnotherUser",
              style: TextStyle(color: Colors.greenAccent, fontSize: 20),
            ),
          ]
        ),
      ),
    );
  }
}