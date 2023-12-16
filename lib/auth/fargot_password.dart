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
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 250,bottom: 10,right: 10,left: 10),
                child: const Text("パスワードを変更するためにお客様のアカウント宛にメールを送りますので、登録したアカウントを入力してください。"),
              ),
              // メールアドレス入力用テキストフィールド
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'メールアドレス',
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.black),
                  fillColor: Colors.grey[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              // パスワードリセットボタン
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text);
                      // ignore: avoid_print
                      print("パスワードリセット用のメールを送信しました");
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'パスワードリセットする',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // TextButton(
              //     child: const Text('パスワードリセットする'),
              //     onPressed: () async {
              //       try {
              //         await FirebaseAuth.instance
              //             .sendPasswordResetEmail(email: email);
              //         // ignore: avoid_print
              //         print("パスワードリセット用のメールを送信しました");
              //       } catch (e) {
              //         // ignore: avoid_print
              //         print(e);
              //       }
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}