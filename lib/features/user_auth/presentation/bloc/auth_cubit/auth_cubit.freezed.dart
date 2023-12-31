// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

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
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AuthState.initial()';
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
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
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
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
          _$LoginSuccessImpl value, $Res Function(_$LoginSuccessImpl) then) =
      __$$LoginSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
      _$LoginSuccessImpl _value, $Res Function(_$LoginSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoginSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoginSuccessImpl implements _LoginSuccess {
  const _$LoginSuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.loginSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<_$LoginSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) {
    return loginSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) {
    return loginSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements AuthState {
  const factory _LoginSuccess(final User user) = _$LoginSuccessImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LoginSuccessImplCopyWith<_$LoginSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSuccessImpl implements _AuthSuccess {
  const _$AuthSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.authSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<_$AuthSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) {
    return authSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) {
    return authSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) {
    return authSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) {
    return authSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(this);
    }
    return orElse();
  }
}

abstract class _AuthSuccess implements AuthState {
  const factory _AuthSuccess(final String message) = _$AuthSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFailedImplCopyWith<$Res> {
  factory _$$LoginFailedImplCopyWith(
          _$LoginFailedImpl value, $Res Function(_$LoginFailedImpl) then) =
      __$$LoginFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String failMessage});
}

/// @nodoc
class __$$LoginFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginFailedImpl>
    implements _$$LoginFailedImplCopyWith<$Res> {
  __$$LoginFailedImplCopyWithImpl(
      _$LoginFailedImpl _value, $Res Function(_$LoginFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failMessage = null,
  }) {
    return _then(_$LoginFailedImpl(
      null == failMessage
          ? _value.failMessage
          : failMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginFailedImpl implements _LoginFailed {
  const _$LoginFailedImpl(this.failMessage);

  @override
  final String failMessage;

  @override
  String toString() {
    return 'AuthState.loginFailed(failMessage: $failMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFailedImpl &&
            (identical(other.failMessage, failMessage) ||
                other.failMessage == failMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFailedImplCopyWith<_$LoginFailedImpl> get copyWith =>
      __$$LoginFailedImplCopyWithImpl<_$LoginFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) {
    return loginFailed(failMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) {
    return loginFailed?.call(failMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(failMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) {
    return loginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) {
    return loginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(this);
    }
    return orElse();
  }
}

abstract class _LoginFailed implements AuthState {
  const factory _LoginFailed(final String failMessage) = _$LoginFailedImpl;

  String get failMessage;
  @JsonKey(ignore: true)
  _$$LoginFailedImplCopyWith<_$LoginFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsAuthPageImplCopyWith<$Res> {
  factory _$$IsAuthPageImplCopyWith(
          _$IsAuthPageImpl value, $Res Function(_$IsAuthPageImpl) then) =
      __$$IsAuthPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsAuthPageImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$IsAuthPageImpl>
    implements _$$IsAuthPageImplCopyWith<$Res> {
  __$$IsAuthPageImplCopyWithImpl(
      _$IsAuthPageImpl _value, $Res Function(_$IsAuthPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsAuthPageImpl implements _IsAuthPage {
  const _$IsAuthPageImpl();

  @override
  String toString() {
    return 'AuthState.isAuthPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsAuthPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) loginSuccess,
    required TResult Function(String message) authSuccess,
    required TResult Function(String failMessage) loginFailed,
    required TResult Function() isAuthPage,
  }) {
    return isAuthPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(User user)? loginSuccess,
    TResult? Function(String message)? authSuccess,
    TResult? Function(String failMessage)? loginFailed,
    TResult? Function()? isAuthPage,
  }) {
    return isAuthPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? loginSuccess,
    TResult Function(String message)? authSuccess,
    TResult Function(String failMessage)? loginFailed,
    TResult Function()? isAuthPage,
    required TResult orElse(),
  }) {
    if (isAuthPage != null) {
      return isAuthPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_AuthSuccess value) authSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
    required TResult Function(_IsAuthPage value) isAuthPage,
  }) {
    return isAuthPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoginSuccess value)? loginSuccess,
    TResult? Function(_AuthSuccess value)? authSuccess,
    TResult? Function(_LoginFailed value)? loginFailed,
    TResult? Function(_IsAuthPage value)? isAuthPage,
  }) {
    return isAuthPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_AuthSuccess value)? authSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    TResult Function(_IsAuthPage value)? isAuthPage,
    required TResult orElse(),
  }) {
    if (isAuthPage != null) {
      return isAuthPage(this);
    }
    return orElse();
  }
}

abstract class _IsAuthPage implements AuthState {
  const factory _IsAuthPage() = _$IsAuthPageImpl;
}
