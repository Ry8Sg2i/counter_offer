// ignore_for_file: camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:counterofferv1/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

class accountSetting extends ConsumerWidget {
  const accountSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final User user = ref.watch(userProvider.notifier).state!;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "Account",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            Text(
                '${user.email}',
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ]
          ),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10,),
                  child: const Text("アカウントからログアウトしたり、アカウント停止オプションの詳細を確認したりできます。"),
                ),
              ],
            ),
            Card(
              child: ExpansionTile(
                title: const Text("logout"),
                children: <Widget>[
                  const Text("アカウントからLogoutします"),
                  TextButton(
                    onPressed: () async {
                      FirebaseAuth.instance.signOut();
                      await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                          ),
                        (route) => false);
                    }, 
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: const Text("DeleteAccount"),
                children: <Widget>[
                  const Text('アカウントを削除するボタンです'),
                  TextButton(
                    onPressed: () async {
                      // 投稿メッセージのドキュメントを削除
                      await FirebaseFirestore.instance
                          .collection('posts')
                          .doc(ref.watch(uidProvider))
                          .delete();
                      // ignore: use_build_context_synchronously
                      await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                          ),
                        (route) => false);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}