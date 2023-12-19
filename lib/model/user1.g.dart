// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$User1Impl _$$User1ImplFromJson(Map<String, dynamic> json) => _$User1Impl(
      name: json['name'] as String,
      emailForCompany: json['emailForCompany'] as String,
      email: json['email'] as String,
      date: json['date'] as String,
      githubid: json['githubid'] as String,
      sentence: json['sentence'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$User1ImplToJson(_$User1Impl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'emailForCompany': instance.emailForCompany,
      'email': instance.email,
      'date': instance.date,
      'githubid': instance.githubid,
      'sentence': instance.sentence,
      'uid': instance.uid,
    };
