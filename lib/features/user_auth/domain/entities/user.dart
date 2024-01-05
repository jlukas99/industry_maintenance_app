import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';
@freezed
class MyUser with _$MyUser{
  const factory MyUser({
    required String userName,
    required String userPassword,
    required String userLogin,
    required String userSurName,
    @Default('') String userID,
    @Default('') String jobPosition,
}) = _User;
  factory MyUser.fromJson(Map<String, dynamic>? json) => _$MyUserFromJson(json!);
  factory MyUser.empty() => const MyUser(
      userName: '',
      userPassword: '',
      userLogin: '',
      userSurName: '',
      userID: '',
      jobPosition: '',
  );
}
