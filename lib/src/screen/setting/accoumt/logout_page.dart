// ignore_for_file: camel_case_types
import 'package:counterofferv1/compornents/appbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:counterofferv1/provider/river1.dart';

class logoutSetting extends ConsumerWidget {
  const logoutSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final User user = ref.watch(userProvider.notifier).state!;

    return Scaffold(
      appBar: const AppBarComponentWidget(
        title: "Setting",
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10,),
                  child: Text("現在のアカウント${user.email}\nアカウントからログアウトします。"),
                ),
              ],
            ),
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    context.pushReplacement('/login');
                  }, 
                  child: const Text(
                    'Logout',
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