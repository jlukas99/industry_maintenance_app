// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userName: json['userName'] as String,
      userPassword: json['userPassword'] as String,
      userLogin: json['userLogin'] as String,
      userSurName: json['userSurName'] as String,
      userID: json['userID'] as String? ?? '',
      jobPosition: json['jobPosition'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userPassword': instance.userPassword,
      'userLogin': instance.userLogin,
      'userSurName': instance.userSurName,
      'userID': instance.userID,
      'jobPosition': instance.jobPosition,
    };
