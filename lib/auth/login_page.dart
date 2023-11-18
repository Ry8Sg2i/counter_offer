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
    // final googleLogin = GoogleSignIn(scopes: [
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ]);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(emailProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(passwordProvider.notifier).state = value;
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(infoText),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final result = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ユーザー情報を更新
                      ref.read(userProvider.notifier).state = result.user;

                      // ignore: use_build_context_synchronously
                      GoRouter.of(context).pushReplacement('/account/addaccount');
                    } catch (e) {
                      // Providerから値を更新
                      ref.read(infoTextProvider.notifier).state =
                      "登録に失敗しました：${e.toString()}";
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: const Text('ログイン'),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ignore: use_build_context_synchronously
                      context.go('/main');
                    } on FirebaseAuthException catch (e) {
                      // Providerから値を更新
                      ref.read(infoTextProvider.notifier).state =
                      "ログインに失敗しました：${e.toString()}";
                    }
                  },
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: OutlinedButton(
              //     // ボタンを押した時のイベント
              //     onPressed: () async {
              //       // Google認証
              //       GoogleSignInAccount? signinAccount = await googleLogin.signIn();
              //       if (signinAccount == null) return;
              //       GoogleSignInAuthentication? auth =
              //       await signinAccount.authentication;
              //       final OAuthCredential credential = GoogleAuthProvider.credential(
              //         idToken: auth.idToken,
              //         accessToken: auth.accessToken,
              //       );
              //       // 認証情報をFirebaseに登録
              //       await FirebaseAuth.instance.signInWithCredential(credential);
              //     },
              //     child: const Text('Googleでログイン'),
              //   ),
              // ),
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
                  child: const Text('パスワードを忘れた'))
            ],
          ),
        ),
      ),
    );
  }
}