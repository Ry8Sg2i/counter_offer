// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:go_router/go_router.dart';

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
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.go('/logoutsetting');
                  },
                  child: const Text('Logout')
                ),
              ),
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.go('/deleteaccountsetting');
                  },
                  child: const Text('DeleteAccount')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}