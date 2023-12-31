// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FactoryZone _$FactoryZoneFromJson(Map<String, dynamic> json) {
  return _FactoryZone.fromJson(json);
}

/// @nodoc
mixin _$FactoryZone {
  String get zoneName => throw _privateConstructorUsedError;
  String get zoneID => throw _privateConstructorUsedError;
  String get zonePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactoryZoneCopyWith<FactoryZone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactoryZoneCopyWith<$Res> {
  factory $FactoryZoneCopyWith(
          FactoryZone value, $Res Function(FactoryZone) then) =
      _$FactoryZoneCopyWithImpl<$Res, FactoryZone>;
  @useResult
  $Res call({String zoneName, String zoneID, String zonePicture});
}

/// @nodoc
class _$FactoryZoneCopyWithImpl<$Res, $Val extends FactoryZone>
    implements $FactoryZoneCopyWith<$Res> {
  _$FactoryZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = null,
    Object? zoneID = null,
    Object? zonePicture = null,
  }) {
    return _then(_value.copyWith(
      zoneName: null == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String,
      zoneID: null == zoneID
          ? _value.zoneID
          : zoneID // ignore: cast_nullable_to_non_nullable
              as String,
      zonePicture: null == zonePicture
          ? _value.zonePicture
          : zonePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FactoryZoneImplCopyWith<$Res>
    implements $FactoryZoneCopyWith<$Res> {
  factory _$$FactoryZoneImplCopyWith(
          _$FactoryZoneImpl value, $Res Function(_$FactoryZoneImpl) then) =
      __$$FactoryZoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String zoneName, String zoneID, String zonePicture});
}

/// @nodoc
class __$$FactoryZoneImplCopyWithImpl<$Res>
    extends _$FactoryZoneCopyWithImpl<$Res, _$FactoryZoneImpl>
    implements _$$FactoryZoneImplCopyWith<$Res> {
  __$$FactoryZoneImplCopyWithImpl(
      _$FactoryZoneImpl _value, $Res Function(_$FactoryZoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoneName = null,
    Object? zoneID = null,
    Object? zonePicture = null,
  }) {
    return _then(_$FactoryZoneImpl(
      zoneName: null == zoneName
          ? _value.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String,
      zoneID: null == zoneID
          ? _value.zoneID
          : zoneID // ignore: cast_nullable_to_non_nullable
              as String,
      zonePicture: null == zonePicture
          ? _value.zonePicture
          : zonePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FactoryZoneImpl implements _FactoryZone {
  const _$FactoryZoneImpl(
      {required this.zoneName, required this.zoneID, this.zonePicture = ''});

  factory _$FactoryZoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$FactoryZoneImplFromJson(json);

  @override
  final String zoneName;
  @override
  final String zoneID;
  @override
  @JsonKey()
  final String zonePicture;

  @override
  String toString() {
    return 'FactoryZone(zoneName: $zoneName, zoneID: $zoneID, zonePicture: $zonePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FactoryZoneImpl &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.zoneID, zoneID) || other.zoneID == zoneID) &&
            (identical(other.zonePicture, zonePicture) ||
                other.zonePicture == zonePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, zoneName, zoneID, zonePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FactoryZoneImplCopyWith<_$FactoryZoneImpl> get copyWith =>
      __$$FactoryZoneImplCopyWithImpl<_$FactoryZoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FactoryZoneImplToJson(
      this,
    );
  }
}

abstract class _FactoryZone implements FactoryZone {
  const factory _FactoryZone(
      {required final String zoneName,
      required final String zoneID,
      final String zonePicture}) = _$FactoryZoneImpl;

  factory _FactoryZone.fromJson(Map<String, dynamic> json) =
      _$FactoryZoneImpl.fromJson;

  @override
  String get zoneName;
  @override
  String get zoneID;
  @override
  String get zonePicture;
  @override
  @JsonKey(ignore: true)
  _$$FactoryZoneImplCopyWith<_$FactoryZoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
