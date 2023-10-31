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
  String get user1Name => throw _privateConstructorUsedError;
  String get user1Email => throw _privateConstructorUsedError;
  String get user1githubid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $User1CopyWith<User1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $User1CopyWith<$Res> {
  factory $User1CopyWith(User1 value, $Res Function(User1) then) =
      _$User1CopyWithImpl<$Res, User1>;
  @useResult
  $Res call({String user1Name, String user1Email, String user1githubid});
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
    Object? user1Name = null,
    Object? user1Email = null,
    Object? user1githubid = null,
  }) {
    return _then(_value.copyWith(
      user1Name: null == user1Name
          ? _value.user1Name
          : user1Name // ignore: cast_nullable_to_non_nullable
              as String,
      user1Email: null == user1Email
          ? _value.user1Email
          : user1Email // ignore: cast_nullable_to_non_nullable
              as String,
      user1githubid: null == user1githubid
          ? _value.user1githubid
          : user1githubid // ignore: cast_nullable_to_non_nullable
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
  $Res call({String user1Name, String user1Email, String user1githubid});
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
    Object? user1Name = null,
    Object? user1Email = null,
    Object? user1githubid = null,
  }) {
    return _then(_$User1Impl(
      user1Name: null == user1Name
          ? _value.user1Name
          : user1Name // ignore: cast_nullable_to_non_nullable
              as String,
      user1Email: null == user1Email
          ? _value.user1Email
          : user1Email // ignore: cast_nullable_to_non_nullable
              as String,
      user1githubid: null == user1githubid
          ? _value.user1githubid
          : user1githubid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User1Impl extends _User1 with DiagnosticableTreeMixin {
  const _$User1Impl(
      {required this.user1Name,
      required this.user1Email,
      required this.user1githubid})
      : super._();

  factory _$User1Impl.fromJson(Map<String, dynamic> json) =>
      _$$User1ImplFromJson(json);

  @override
  final String user1Name;
  @override
  final String user1Email;
  @override
  final String user1githubid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User1(user1Name: $user1Name, user1Email: $user1Email, user1githubid: $user1githubid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User1'))
      ..add(DiagnosticsProperty('user1Name', user1Name))
      ..add(DiagnosticsProperty('user1Email', user1Email))
      ..add(DiagnosticsProperty('user1githubid', user1githubid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User1Impl &&
            (identical(other.user1Name, user1Name) ||
                other.user1Name == user1Name) &&
            (identical(other.user1Email, user1Email) ||
                other.user1Email == user1Email) &&
            (identical(other.user1githubid, user1githubid) ||
                other.user1githubid == user1githubid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, user1Name, user1Email, user1githubid);

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

abstract class _User1 extends User1 {
  const factory _User1(
      {required final String user1Name,
      required final String user1Email,
      required final String user1githubid}) = _$User1Impl;
  const _User1._() : super._();

  factory _User1.fromJson(Map<String, dynamic> json) = _$User1Impl.fromJson;

  @override
  String get user1Name;
  @override
  String get user1Email;
  @override
  String get user1githubid;
  @override
  @JsonKey(ignore: true)
  _$$User1ImplCopyWith<_$User1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
