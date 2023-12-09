// ignore_for_file: camel_case_types, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:go_router/go_router.dart';

class deleteAccountSetting extends ConsumerWidget {
  const deleteAccountSetting({super.key});

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
                "DeleteAccount",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            Text(
                '${user.email}',
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ]
          ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10,),
                  child: const Text("アカウントを削除します。この動作は取り消すことはできません。本当によろしいですか？"),
                ),
              ],
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    // 投稿メッセージのドキュメントを削除
                    await FirebaseFirestore.instance
                        .collection('User1')
                        .doc(ref.watch(uidProvider))
                        .delete();
                    await user.delete();
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    context.pushReplacement('/login');
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}