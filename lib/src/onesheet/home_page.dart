import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/1111.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 10, bottom: 50, left: 10),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.pushReplacement('/login');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 16,
                    ),
                    child: const Text('アカウント登録/ログイン',style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}