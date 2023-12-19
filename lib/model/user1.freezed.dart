// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User1 _$User1FromJson(Map<String, dynamic> json) {
  return _User1.fromJson(json);
}

/// @nodoc
mixin _$User1 {
  String get name => throw _privateConstructorUsedError;
  String get emailForCompany => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get githubid => throw _privateConstructorUsedError;
  String get sentence => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $User1CopyWith<User1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $User1CopyWith<$Res> {
  factory $User1CopyWith(User1 value, $Res Function(User1) then) =
      _$User1CopyWithImpl<$Res, User1>;
  @useResult
  $Res call(
      {String name,
      String emailForCompany,
      String email,
      String date,
      String githubid,
      String sentence,
      String uid});
}

/// @nodoc
class _$User1CopyWithImpl<$Res, $Val extends User1>
    implements $User1CopyWith<$Res> {
  _$User1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? emailForCompany = null,
    Object? email = null,
    Object? date = null,
    Object? githubid = null,
    Object? sentence = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailForCompany: null == emailForCompany
          ? _value.emailForCompany
          : emailForCompany // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      githubid: null == githubid
          ? _value.githubid
          : githubid // ignore: cast_nullable_to_non_nullable
              as String,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$User1ImplCopyWith<$Res> implements $User1CopyWith<$Res> {
  factory _$$User1ImplCopyWith(
          _$User1Impl value, $Res Function(_$User1Impl) then) =
      __$$User1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String emailForCompany,
      String email,
      String date,
      String githubid,
      String sentence,
      String uid});
}

/// @nodoc
class __$$User1ImplCopyWithImpl<$Res>
    extends _$User1CopyWithImpl<$Res, _$User1Impl>
    implements _$$User1ImplCopyWith<$Res> {
  __$$User1ImplCopyWithImpl(
      _$User1Impl _value, $Res Function(_$User1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? emailForCompany = null,
    Object? email = null,
    Object? date = null,
    Object? githubid = null,
    Object? sentence = null,
    Object? uid = null,
  }) {
    return _then(_$User1Impl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailForCompany: null == emailForCompany
          ? _value.emailForCompany
          : emailForCompany // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      githubid: null == githubid
          ? _value.githubid
          : githubid // ignore: cast_nullable_to_non_nullable
              as String,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User1Impl with DiagnosticableTreeMixin implements _User1 {
  const _$User1Impl(
      {required this.name,
      required this.emailForCompany,
      required this.email,
      required this.date,
      required this.githubid,
      required this.sentence,
      required this.uid});

  factory _$User1Impl.fromJson(Map<String, dynamic> json) =>
      _$$User1ImplFromJson(json);

  @override
  final String name;
  @override
  final String emailForCompany;
  @override
  final String email;
  @override
  final String date;
  @override
  final String githubid;
  @override
  final String sentence;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User1(name: $name, emailForCompany: $emailForCompany, email: $email, date: $date, githubid: $githubid, sentence: $sentence, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User1'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('emailForCompany', emailForCompany))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('githubid', githubid))
      ..add(DiagnosticsProperty('sentence', sentence))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User1Impl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emailForCompany, emailForCompany) ||
                other.emailForCompany == emailForCompany) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.githubid, githubid) ||
                other.githubid == githubid) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, emailForCompany, email, date, githubid, sentence, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$User1ImplCopyWith<_$User1Impl> get copyWith =>
      __$$User1ImplCopyWithImpl<_$User1Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$User1ImplToJson(
      this,
    );
  }
}

abstract class _User1 implements User1 {
  const factory _User1(
      {required final String name,
      required final String emailForCompany,
      required final String email,
      required final String date,
      required final String githubid,
      required final String sentence,
      required final String uid}) = _$User1Impl;

  factory _User1.fromJson(Map<String, dynamic> json) = _$User1Impl.fromJson;

  @override
  String get name;
  @override
  String get emailForCompany;
  @override
  String get email;
  @override
  String get date;
  @override
  String get githubid;
  @override
  String get sentence;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$User1ImplCopyWith<_$User1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
