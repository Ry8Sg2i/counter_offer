import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final infoText = ref.watch(infoTextProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                controller: email,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                controller: password,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(infoText),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 16,
                  ),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final result = await auth.createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      // ユーザー情報を更新
                      ref.read(userProvider.notifier).state = result.user;
                      // ignore: use_build_context_synchronously
                      GoRouter.of(context).pushReplacement('/login/newaccount');
                    } catch (e) {
                      // Providerから値を更新
                      ref.read(infoTextProvider.notifier).state =
                      "登録に失敗しました。";
                    }
                  },
                  child: const Text('ユーザー登録',style:TextStyle(color:Colors.white))
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: const Text('ログイン',style: TextStyle(color: Colors.black)),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      // ignore: use_build_context_synchronously
                      context.go('/main');
                    } on FirebaseAuthException {
                      // Providerから値を更新
                      ref.read(infoTextProvider.notifier).state =
                      "ログインに失敗しました。\nアカウント、パスワードをもう一度お確かめください。";
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    '戻る',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/login/fargotpass');
                  },
                  child: const Text('パスワードを忘れた',style: TextStyle(color: Colors.black))
                ),
            ],
          ),
        ),
      ),
    );
  }
}