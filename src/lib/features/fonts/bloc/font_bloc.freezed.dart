// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'font_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FontState {
  bool get isProcessing => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<FontDescription> get fonts => throw _privateConstructorUsedError;
  StoreData get storeData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FontStateCopyWith<FontState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontStateCopyWith<$Res> {
  factory $FontStateCopyWith(FontState value, $Res Function(FontState) then) =
      _$FontStateCopyWithImpl<$Res, FontState>;
  @useResult
  $Res call(
      {bool isProcessing,
      String message,
      List<FontDescription> fonts,
      StoreData storeData});

  $StoreDataCopyWith<$Res> get storeData;
}

/// @nodoc
class _$FontStateCopyWithImpl<$Res, $Val extends FontState>
    implements $FontStateCopyWith<$Res> {
  _$FontStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? message = null,
    Object? fonts = null,
    Object? storeData = null,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fonts: null == fonts
          ? _value.fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<FontDescription>,
      storeData: null == storeData
          ? _value.storeData
          : storeData // ignore: cast_nullable_to_non_nullable
              as StoreData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreDataCopyWith<$Res> get storeData {
    return $StoreDataCopyWith<$Res>(_value.storeData, (value) {
      return _then(_value.copyWith(storeData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FontStateCopyWith<$Res> implements $FontStateCopyWith<$Res> {
  factory _$$_FontStateCopyWith(
          _$_FontState value, $Res Function(_$_FontState) then) =
      __$$_FontStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isProcessing,
      String message,
      List<FontDescription> fonts,
      StoreData storeData});

  @override
  $StoreDataCopyWith<$Res> get storeData;
}

/// @nodoc
class __$$_FontStateCopyWithImpl<$Res>
    extends _$FontStateCopyWithImpl<$Res, _$_FontState>
    implements _$$_FontStateCopyWith<$Res> {
  __$$_FontStateCopyWithImpl(
      _$_FontState _value, $Res Function(_$_FontState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? message = null,
    Object? fonts = null,
    Object? storeData = null,
  }) {
    return _then(_$_FontState(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fonts: null == fonts
          ? _value._fonts
          : fonts // ignore: cast_nullable_to_non_nullable
              as List<FontDescription>,
      storeData: null == storeData
          ? _value.storeData
          : storeData // ignore: cast_nullable_to_non_nullable
              as StoreData,
    ));
  }
}

/// @nodoc

class _$_FontState implements _FontState {
  const _$_FontState(
      {required this.isProcessing,
      required this.message,
      required final List<FontDescription> fonts,
      required this.storeData})
      : _fonts = fonts;

  @override
  final bool isProcessing;
  @override
  final String message;
  final List<FontDescription> _fonts;
  @override
  List<FontDescription> get fonts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fonts);
  }

  @override
  final StoreData storeData;

  @override
  String toString() {
    return 'FontState(isProcessing: $isProcessing, message: $message, fonts: $fonts, storeData: $storeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FontState &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._fonts, _fonts) &&
            (identical(other.storeData, storeData) ||
                other.storeData == storeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, message,
      const DeepCollectionEquality().hash(_fonts), storeData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FontStateCopyWith<_$_FontState> get copyWith =>
      __$$_FontStateCopyWithImpl<_$_FontState>(this, _$identity);
}

abstract class _FontState implements FontState {
  const factory _FontState(
      {required final bool isProcessing,
      required final String message,
      required final List<FontDescription> fonts,
      required final StoreData storeData}) = _$_FontState;

  @override
  bool get isProcessing;
  @override
  String get message;
  @override
  List<FontDescription> get fonts;
  @override
  StoreData get storeData;
  @override
  @JsonKey(ignore: true)
  _$$_FontStateCopyWith<_$_FontState> get copyWith =>
      throw _privateConstructorUsedError;
}
