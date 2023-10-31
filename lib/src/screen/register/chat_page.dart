import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counterofferv1/src/screan/register/addPost_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

// ConsumerWidgetでProviderから値を受け渡す
class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final User user = ref.watch(userProvider.notifier).state!;
    final AsyncValue<QuerySnapshot> asyncPostsQuery = ref.watch(postsQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AllUser'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text('ログイン情報：${user.email}'),
          ),
          Expanded(
            // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
            child: asyncPostsQuery.when(
              // 値が取得できたとき
              data: (QuerySnapshot query) {
                return ListView(
                  children: query.docs.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['name']),
                        subtitle: Text(document['email']),
                        trailing: document['email'] == user.email
                            ? IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            // 投稿メッセージのドキュメントを削除
                            await FirebaseFirestore.instance
                                .collection('posts')
                                .doc(ref.watch(uidProvider))
                                .delete();
                          },
                        )
                            : null,
                      ),
                    );
                  }).toList(),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AddPostPage();
            }),
          );
        },
      ),
    );
  }
}