// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(T? data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseInitial<T> value) initial,
    required TResult Function(BaseLoading<T> value) loading,
    required TResult Function(BaseError<T> value) error,
    required TResult Function(BaseSuccess<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res> implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  final BaseState<T> _value;
  // ignore: unused_field
  final $Res Function(BaseState<T>) _then;
}

/// @nodoc
abstract class _$$BaseInitialCopyWith<T, $Res> {
  factory _$$BaseInitialCopyWith(
          _$BaseInitial<T> value, $Res Function(_$BaseInitial<T>) then) =
      __$$BaseInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseInitialCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$$BaseInitialCopyWith<T, $Res> {
  __$$BaseInitialCopyWithImpl(
      _$BaseInitial<T> _value, $Res Function(_$BaseInitial<T>) _then)
      : super(_value, (v) => _then(v as _$BaseInitial<T>));

  @override
  _$BaseInitial<T> get _value => super._value as _$BaseInitial<T>;
}

/// @nodoc

class _$BaseInitial<T> implements BaseInitial<T> {
  const _$BaseInitial();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BaseInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(T? data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
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
    required TResult Function(BaseInitial<T> value) initial,
    required TResult Function(BaseLoading<T> value) loading,
    required TResult Function(BaseError<T> value) error,
    required TResult Function(BaseSuccess<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BaseInitial<T> implements BaseState<T> {
  const factory BaseInitial() = _$BaseInitial<T>;
}

/// @nodoc
abstract class _$$BaseLoadingCopyWith<T, $Res> {
  factory _$$BaseLoadingCopyWith(
          _$BaseLoading<T> value, $Res Function(_$BaseLoading<T>) then) =
      __$$BaseLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseLoadingCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$$BaseLoadingCopyWith<T, $Res> {
  __$$BaseLoadingCopyWithImpl(
      _$BaseLoading<T> _value, $Res Function(_$BaseLoading<T>) _then)
      : super(_value, (v) => _then(v as _$BaseLoading<T>));

  @override
  _$BaseLoading<T> get _value => super._value as _$BaseLoading<T>;
}

/// @nodoc

class _$BaseLoading<T> implements BaseLoading<T> {
  const _$BaseLoading();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BaseLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(T? data) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseInitial<T> value) initial,
    required TResult Function(BaseLoading<T> value) loading,
    required TResult Function(BaseError<T> value) error,
    required TResult Function(BaseSuccess<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BaseLoading<T> implements BaseState<T> {
  const factory BaseLoading() = _$BaseLoading<T>;
}

/// @nodoc
abstract class _$$BaseErrorCopyWith<T, $Res> {
  factory _$$BaseErrorCopyWith(
          _$BaseError<T> value, $Res Function(_$BaseError<T>) then) =
      __$$BaseErrorCopyWithImpl<T, $Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$BaseErrorCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$$BaseErrorCopyWith<T, $Res> {
  __$$BaseErrorCopyWithImpl(
      _$BaseError<T> _value, $Res Function(_$BaseError<T>) _then)
      : super(_value, (v) => _then(v as _$BaseError<T>));

  @override
  _$BaseError<T> get _value => super._value as _$BaseError<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$BaseError<T>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$BaseError<T> implements BaseError<T> {
  const _$BaseError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$T>.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseError<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$BaseErrorCopyWith<T, _$BaseError<T>> get copyWith =>
      __$$BaseErrorCopyWithImpl<T, _$BaseError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(T? data) success,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseInitial<T> value) initial,
    required TResult Function(BaseLoading<T> value) loading,
    required TResult Function(BaseError<T> value) error,
    required TResult Function(BaseSuccess<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BaseError<T> implements BaseState<T> {
  const factory BaseError(final Failure failure) = _$BaseError<T>;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$BaseErrorCopyWith<T, _$BaseError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseSuccessCopyWith<T, $Res> {
  factory _$$BaseSuccessCopyWith(
          _$BaseSuccess<T> value, $Res Function(_$BaseSuccess<T>) then) =
      __$$BaseSuccessCopyWithImpl<T, $Res>;
  $Res call({T? data});
}

/// @nodoc
class __$$BaseSuccessCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res>
    implements _$$BaseSuccessCopyWith<T, $Res> {
  __$$BaseSuccessCopyWithImpl(
      _$BaseSuccess<T> _value, $Res Function(_$BaseSuccess<T>) _then)
      : super(_value, (v) => _then(v as _$BaseSuccess<T>));

  @override
  _$BaseSuccess<T> get _value => super._value as _$BaseSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseSuccess<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$BaseSuccess<T> implements BaseSuccess<T> {
  const _$BaseSuccess({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'BaseState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$BaseSuccessCopyWith<T, _$BaseSuccess<T>> get copyWith =>
      __$$BaseSuccessCopyWithImpl<T, _$BaseSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(T? data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseInitial<T> value) initial,
    required TResult Function(BaseLoading<T> value) loading,
    required TResult Function(BaseError<T> value) error,
    required TResult Function(BaseSuccess<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseInitial<T> value)? initial,
    TResult Function(BaseLoading<T> value)? loading,
    TResult Function(BaseError<T> value)? error,
    TResult Function(BaseSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BaseSuccess<T> implements BaseState<T> {
  const factory BaseSuccess({final T? data}) = _$BaseSuccess<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$BaseSuccessCopyWith<T, _$BaseSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
