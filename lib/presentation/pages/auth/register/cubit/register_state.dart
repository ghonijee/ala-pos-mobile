part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.submitted() = _Submitted;
  const factory RegisterState.success() = _Success;
  const factory RegisterState.failed({message}) = _Failed;
}
