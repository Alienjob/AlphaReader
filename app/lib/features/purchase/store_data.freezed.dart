// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreData {
  bool get available => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  StoreDataPurchaseStatus get fonts => throw _privateConstructorUsedError;
  StoreDataPurchaseStatus get adFree => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreDataCopyWith<StoreData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDataCopyWith<$Res> {
  factory $StoreDataCopyWith(StoreData value, $Res Function(StoreData) then) =
      _$StoreDataCopyWithImpl<$Res, StoreData>;
  @useResult
  $Res call(
      {bool available,
      String? error,
      StoreDataPurchaseStatus fonts,
      StoreDataPurchaseStatus adFree});
}

/// @nodoc
class _$StoreDataCopyWithImpl<$Res, $Val extends StoreData>
    implements $StoreDataCopyWith<$Res> {
  _$StoreDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? error = freezed,
    Object? fonts = null,
    Object? adFree = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      fonts: null == fonts
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as StoreDataPurchaseStatus,
      adFree: null == adFree
          ? _value.adFree
          : adFree // ignore: cast_nullable_to_non_nullable
              as StoreDataPurchaseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreDataCopyWith<$Res> implements $StoreDataCopyWith<$Res> {
  factory _$$_StoreDataCopyWith(
          _$_StoreData value, $Res Function(_$_StoreData) then) =
      __$$_StoreDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool available,
      String? error,
      StoreDataPurchaseStatus fonts,
      StoreDataPurchaseStatus adFree});
}

/// @nodoc
class __$$_StoreDataCopyWithImpl<$Res>
    extends _$StoreDataCopyWithImpl<$Res, _$_StoreData>
    implements _$$_StoreDataCopyWith<$Res> {
  __$$_StoreDataCopyWithImpl(
      _$_StoreData _value, $Res Function(_$_StoreData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? error = freezed,
    Object? fonts = null,
    Object? adFree = null,
  }) {
    return _then(_$_StoreData(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      fonts: null == fonts
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as StoreDataPurchaseStatus,
      adFree: null == adFree
          ? _value.adFree
          : adFree // ignore: cast_nullable_to_non_nullable
              as StoreDataPurchaseStatus,
    ));
  }
}

/// @nodoc

class _$_StoreData implements _StoreData {
  const _$_StoreData(
      {required this.available,
      required this.error,
      required this.fonts,
      required this.adFree});

  @override
  final bool available;
  @override
  final String? error;
  @override
  final StoreDataPurchaseStatus fonts;
  @override
  final StoreDataPurchaseStatus adFree;

  @override
  String toString() {
    return 'StoreData(available: $available, error: $error, fonts: $fonts, adFree: $adFree)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreData &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.fonts, fonts) || other.fonts == fonts) &&
            (identical(other.adFree, adFree) || other.adFree == adFree));
  }

  @override
  int get hashCode => Object.hash(runtimeType, available, error, fonts, adFree);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreDataCopyWith<_$_StoreData> get copyWith =>
      __$$_StoreDataCopyWithImpl<_$_StoreData>(this, _$identity);
}

abstract class _StoreData implements StoreData {
  const factory _StoreData(
      {required final bool available,
      required final String? error,
      required final StoreDataPurchaseStatus fonts,
      required final StoreDataPurchaseStatus adFree}) = _$_StoreData;

  @override
  bool get available;
  @override
  String? get error;
  @override
  StoreDataPurchaseStatus get fonts;
  @override
  StoreDataPurchaseStatus get adFree;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDataCopyWith<_$_StoreData> get copyWith =>
      throw _privateConstructorUsedError;
}
