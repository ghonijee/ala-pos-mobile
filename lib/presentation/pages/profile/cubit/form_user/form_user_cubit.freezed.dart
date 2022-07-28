// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormUserState {
  UsernameField get usernameField => throw _privateConstructorUsedError;
  FullnameField get fullnameField => throw _privateConstructorUsedError;
  PasswordField get password => throw _privateConstructorUsedError;
  PhoneField get phone => throw _privateConstructorUsedError;
  EmailField get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormUserStateCopyWith<FormUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormUserStateCopyWith<$Res> {
  factory $FormUserStateCopyWith(
          FormUserState value, $Res Function(FormUserState) then) =
      _$FormUserStateCopyWithImpl<$Res>;
  $Res call(
      {UsernameField usernameField,
      FullnameField fullnameField,
      PasswordField password,
      PhoneField phone,
      EmailField email});
}

/// @nodoc
class _$FormUserStateCopyWithImpl<$Res>
    implements $FormUserStateCopyWith<$Res> {
  _$FormUserStateCopyWithImpl(this._value, this._then);

  final FormUserState _value;
  // ignore: unused_field
  final $Res Function(FormUserState) _then;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? fullnameField = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      fullnameField: fullnameField == freezed
          ? _value.fullnameField
          : fullnameField // ignore: cast_nullable_to_non_nullable
              as FullnameField,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailField,
    ));
  }
}

/// @nodoc
abstract class _$$_FormUserStateCopyWith<$Res>
    implements $FormUserStateCopyWith<$Res> {
  factory _$$_FormUserStateCopyWith(
          _$_FormUserState value, $Res Function(_$_FormUserState) then) =
      __$$_FormUserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UsernameField usernameField,
      FullnameField fullnameField,
      PasswordField password,
      PhoneField phone,
      EmailField email});
}

/// @nodoc
class __$$_FormUserStateCopyWithImpl<$Res>
    extends _$FormUserStateCopyWithImpl<$Res>
    implements _$$_FormUserStateCopyWith<$Res> {
  __$$_FormUserStateCopyWithImpl(
      _$_FormUserState _value, $Res Function(_$_FormUserState) _then)
      : super(_value, (v) => _then(v as _$_FormUserState));

  @override
  _$_FormUserState get _value => super._value as _$_FormUserState;

  @override
  $Res call({
    Object? usernameField = freezed,
    Object? fullnameField = freezed,
    Object? password = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_FormUserState(
      usernameField: usernameField == freezed
          ? _value.usernameField
          : usernameField // ignore: cast_nullable_to_non_nullable
              as UsernameField,
      fullnameField: fullnameField == freezed
          ? _value.fullnameField
          : fullnameField // ignore: cast_nullable_to_non_nullable
              as FullnameField,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneField,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailField,
    ));
  }
}

/// @nodoc

class _$_FormUserState extends _FormUserState {
  const _$_FormUserState(
      {this.usernameField = const UsernameField.pure(),
      this.fullnameField = const FullnameField.pure(),
      this.password = const PasswordField.pure(),
      this.phone = const PhoneField.pure(),
      this.email = const EmailField.pure()})
      : super._();

  @override
  @JsonKey()
  final UsernameField usernameField;
  @override
  @JsonKey()
  final FullnameField fullnameField;
  @override
  @JsonKey()
  final PasswordField password;
  @override
  @JsonKey()
  final PhoneField phone;
  @override
  @JsonKey()
  final EmailField email;

  @override
  String toString() {
    return 'FormUserState(usernameField: $usernameField, fullnameField: $fullnameField, password: $password, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormUserState &&
            const DeepCollectionEquality()
                .equals(other.usernameField, usernameField) &&
            const DeepCollectionEquality()
                .equals(other.fullnameField, fullnameField) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(usernameField),
      const DeepCollectionEquality().hash(fullnameField),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_FormUserStateCopyWith<_$_FormUserState> get copyWith =>
      __$$_FormUserStateCopyWithImpl<_$_FormUserState>(this, _$identity);
}

abstract class _FormUserState extends FormUserState {
  const factory _FormUserState(
      {final UsernameField usernameField,
      final FullnameField fullnameField,
      final PasswordField password,
      final PhoneField phone,
      final EmailField email}) = _$_FormUserState;
  const _FormUserState._() : super._();

  @override
  UsernameField get usernameField => throw _privateConstructorUsedError;
  @override
  FullnameField get fullnameField => throw _privateConstructorUsedError;
  @override
  PasswordField get password => throw _privateConstructorUsedError;
  @override
  PhoneField get phone => throw _privateConstructorUsedError;
  @override
  EmailField get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FormUserStateCopyWith<_$_FormUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
