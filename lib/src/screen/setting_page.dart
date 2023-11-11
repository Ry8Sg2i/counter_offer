import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:counterofferv1/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

// ConsumerWidgetでProviderから値を受け渡す
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

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
                "Setting",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            Text(
                '${user.email}',
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ]
          ),
      ),
      body: Card(
        child: ExpansionTile(
          title: const Text("Account"),
          children: [
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