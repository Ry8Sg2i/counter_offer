import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user1.freezed.dart';
part 'user1.g.dart';

@freezed
abstract class User1 with _$User1 {
  const factory User1({
    required String user1Name,
    required String user1Email,
    required String user1githubid,
  }) = _User1;

  factory User1.fromJson(Map<String, dynamic> json) => _$User1FromJson(json);
}