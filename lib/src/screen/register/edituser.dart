// ignore_for_file: file_names
import 'package:counterofferv1/model/user1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class AddPostPage extends ConsumerWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final user = ref.watch(userProvider.notifier).state!;
    final name = ref.watch(userNameProvider);
    final emailForCompany = ref.watch(userEmailProvider);
    final githubid = ref.watch(userGitProvider);
    final sentence = ref.watch(sentenceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            ]),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(userNameProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'emailForCompany'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(userEmailProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'githubid'),
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(userGitProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'sentence'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (String value) {
                  // Providerから値を更新
                  ref.read(sentenceProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('作成'),
                  onPressed: () async {
                    final date = DateTime.now().toLocal().toIso8601String();
                    final email = user.email;
                    await FirebaseFirestore.instance
                        .collection('User1')
                        .doc(ref.watch(uidProvider))
                        .set(
                          User1(
                            name: name,
                            emailForCompany: emailForCompany,
                            email: email!,
                            date: date,
                            githubid: githubid,
                            sentence: sentence)
                          .toJson(),
                        );
                    // ignore: use_build_context_synchronously
                    context.pushReplacement('/main');
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
