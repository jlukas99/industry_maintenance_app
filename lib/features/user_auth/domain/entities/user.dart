import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';
@freezed
class User with _$User{
  const factory User({
    required String userName,
    required String userPassword,
    required String userLogin,
    required String userSurName,
    @Default('') String userID,
    @Default('') String jobPosition,
}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.empty() => const User(
      userName: '',
      userPassword: '',
      userLogin: '',
      userSurName: '');
}
