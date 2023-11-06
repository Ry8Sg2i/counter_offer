import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

class FargotPassword extends ConsumerWidget {
  const FargotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var email = ref.watch(emailProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('パスワードの再登録'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力用テキストフィールド
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'メールアドレスを入力してください'),
                onChanged: (String value) {
                    email = value;
                },
              ),
              // パスワードリセットボタン
              ElevatedButton(
                  child: const Text('パスワードリセットする'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email);
                      // ignore: avoid_print
                      print("パスワードリセット用のメールを送信しました");
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}