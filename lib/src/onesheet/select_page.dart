import 'package:counterofferv1/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: duplicate_import
import 'package:counterofferv1/src/app.dart';

class SelectPage extends ConsumerWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(userProvider.notifier).state!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('選択'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text('ログイン情報：${user.email}'),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
              child: const Text(
                '生徒用登録ページ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}