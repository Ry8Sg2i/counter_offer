// ignore_for_file: file_names
import 'package:counterofferv1/compornents/appbar.dart';
import 'package:counterofferv1/model/user1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class NewAccount extends ConsumerWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final user = ref.watch(userProvider.notifier).state;
    final name = ref.watch(userNameProvider);
    final emailForCompany = ref.watch(userEmailProvider);
    final githubid = ref.watch(userGitProvider);
    final sentence = ref.watch(sentenceProvider);
    final uid = ref.watch(uidProvider);

    return Scaffold(
      appBar: const AppBarComponentWidget(
        title: 'NewAccount',
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: name,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'emailForCompany'),
                controller: emailForCompany,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'githubid'),
                controller: githubid,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'sentence'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: sentence,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('作成'),
                  onPressed: () async {
                    final date = DateTime.now().toLocal().toIso8601String();
                    final email = user?.email;
                    if (email != null && email.isNotEmpty) {
                      await FirebaseFirestore.instance
                          .collection('User1')
                          .doc(uid)
                          .set(
                            User1(
                              name: name.text,
                              emailForCompany: emailForCompany.text,
                              email: email,
                              date: date,
                              githubid: githubid.text,
                              sentence: sentence.text,
                              uid: uid)
                          .toJson(),
                          );
                      // ignore: use_build_context_synchronously
                      context.pushReplacement('/main');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
