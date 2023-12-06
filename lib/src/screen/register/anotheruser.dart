import 'package:flutter/material.dart';
import 'package:counterofferv1/model/user1.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnotherUser extends ConsumerWidget {
  const AnotherUser({
    super.key,
      required this.user1Data
  });
  final User1 user1Data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final user1Data = ref.watch(user1Provider);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "AnotherUser",
              style: TextStyle(color: Colors.greenAccent, fontSize: 20),
            ),
          ]
        ),
      ),
      body: user1Data.when(data: (data) {
        return  Card(
          child: ExpansionTile(
            leading: const Icon(Icons.description),
            title: const Text("name"),
            children: <Widget>[
              ListTile(
                title: Text(data.name),
              ),
            ],
          ),
        );
      },
        // 値が読込中のとき
        loading: () {
          return const Center(
            child: Text('読込中...'),
          );
        },
        // 値の取得に失敗したとき
        error: (e, stackTrace) {
          return Center(
            child: Text(e.toString()),
          );
        },
      ),
    );
  }
}