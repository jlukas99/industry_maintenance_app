// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MyUser user) userLoggedIn,
    required TResult Function() userLoggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(MyUser user)? userLoggedIn,
    TResult? Function()? userLoggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MyUser user)? userLoggedIn,
    TResult Function()? userLoggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarStateCopyWith<$Res> {
  factory $AppBarStateCopyWith(
          AppBarState value, $Res Function(AppBarState) then) =
      _$AppBarStateCopyWithImpl<$Res, AppBarState>;
}

/// @nodoc
class _$AppBarStateCopyWithImpl<$Res, $Val extends AppBarState>
    implements $AppBarStateCopyWith<$Res> {
  _$AppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppBarState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MyUser user) userLoggedIn,
    required TResult Function() userLoggedOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(MyUser user)? userLoggedIn,
    TResult? Function()? userLoggedOut,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MyUser user)? userLoggedIn,
    TResult Function()? userLoggedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppBarState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$UserLoggedInImplCopyWith<$Res> {
  factory _$$UserLoggedInImplCopyWith(
          _$UserLoggedInImpl value, $Res Function(_$UserLoggedInImpl) then) =
      __$$UserLoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MyUser user});

  $MyUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserLoggedInImplCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$UserLoggedInImpl>
    implements _$$UserLoggedInImplCopyWith<$Res> {
  __$$UserLoggedInImplCopyWithImpl(
      _$UserLoggedInImpl _value, $Res Function(_$UserLoggedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserLoggedInImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MyUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MyUserCopyWith<$Res> get user {
    return $MyUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserLoggedInImpl implements _UserLoggedIn {
  const _$UserLoggedInImpl(this.user);

  @override
  final MyUser user;

  @override
  String toString() {
    return 'AppBarState.userLoggedIn(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoggedInImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoggedInImplCopyWith<_$UserLoggedInImpl> get copyWith =>
      __$$UserLoggedInImplCopyWithImpl<_$UserLoggedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MyUser user) userLoggedIn,
    required TResult Function() userLoggedOut,
  }) {
    return userLoggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(MyUser user)? userLoggedIn,
    TResult? Function()? userLoggedOut,
  }) {
    return userLoggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MyUser user)? userLoggedIn,
    TResult Function()? userLoggedOut,
    required TResult orElse(),
  }) {
    if (userLoggedIn != null) {
      return userLoggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
  }) {
    return userLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
  }) {
    return userLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    required TResult orElse(),
  }) {
    if (userLoggedIn != null) {
      return userLoggedIn(this);
    }
    return orElse();
  }
}

abstract class _UserLoggedIn implements AppBarState {
  const factory _UserLoggedIn(final MyUser user) = _$UserLoggedInImpl;

  MyUser get user;
  @JsonKey(ignore: true)
  _$$UserLoggedInImplCopyWith<_$UserLoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLoggedOutImplCopyWith<$Res> {
  factory _$$UserLoggedOutImplCopyWith(
          _$UserLoggedOutImpl value, $Res Function(_$UserLoggedOutImpl) then) =
      __$$UserLoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoggedOutImplCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$UserLoggedOutImpl>
    implements _$$UserLoggedOutImplCopyWith<$Res> {
  __$$UserLoggedOutImplCopyWithImpl(
      _$UserLoggedOutImpl _value, $Res Function(_$UserLoggedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoggedOutImpl implements _UserLoggedOut {
  const _$UserLoggedOutImpl();

  @override
  String toString() {
    return 'AppBarState.userLoggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(MyUser user) userLoggedIn,
    required TResult Function() userLoggedOut,
  }) {
    return userLoggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(MyUser user)? userLoggedIn,
    TResult? Function()? userLoggedOut,
  }) {
    return userLoggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(MyUser user)? userLoggedIn,
    TResult Function()? userLoggedOut,
    required TResult orElse(),
  }) {
    if (userLoggedOut != null) {
      return userLoggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserLoggedIn value) userLoggedIn,
    required TResult Function(_UserLoggedOut value) userLoggedOut,
  }) {
    return userLoggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserLoggedIn value)? userLoggedIn,
    TResult? Function(_UserLoggedOut value)? userLoggedOut,
  }) {
    return userLoggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserLoggedIn value)? userLoggedIn,
    TResult Function(_UserLoggedOut value)? userLoggedOut,
    required TResult orElse(),
  }) {
    if (userLoggedOut != null) {
      return userLoggedOut(this);
    }
    return orElse();
  }
}

abstract class _UserLoggedOut implements AppBarState {
  const factory _UserLoggedOut() = _$UserLoggedOutImpl;
}
