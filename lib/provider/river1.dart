import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance.currentUser;
});

final uidProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance.currentUser?.uid;
});

// エラー情報の受け渡しを行うためのProvider
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

// 名前の受け渡しを行うためのProvider
final userNameProvider = StateProvider.autoDispose((ref) {
  return '';
});

// emailの受け渡しを行うためのProvider
final userEmailProvider = StateProvider.autoDispose((ref) {
  return '';
});

// githubidの受け渡しを行うためのProvider
final userGitProvider = StateProvider.autoDispose((ref) {
  return '';
});

final appealProvider = StateProvider.autoDispose((ref) {
  return '';
});

// StreamProviderを使うことでStreamも扱うことができる
final postsQueryProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('posts')
      .orderBy('date')
      .snapshots();
});

final user1Provider = FutureProvider.autoDispose((ref) {
  final uid = ref.watch(uidProvider);
  return FirebaseFirestore.instance
      .collection('posts')
      .doc(uid)
      .get();
});
