// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) {
  return _SliderModel.fromJson(json);
}

/// @nodoc
class _$SliderModelTearOff {
  const _$SliderModelTearOff();

  _SliderModel call(
      {required String sliderName,
      required String sliderImage,
      required String sliderId}) {
    return _SliderModel(
      sliderName: sliderName,
      sliderImage: sliderImage,
      sliderId: sliderId,
    );
  }

  SliderModel fromJson(Map<String, Object?> json) {
    return SliderModel.fromJson(json);
  }
}

/// @nodoc
const $SliderModel = _$SliderModelTearOff();

/// @nodoc
mixin _$SliderModel {
  String get sliderName => throw _privateConstructorUsedError;
  String get sliderImage => throw _privateConstructorUsedError;
  String get sliderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderModelCopyWith<SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderModelCopyWith<$Res> {
  factory $SliderModelCopyWith(
          SliderModel value, $Res Function(SliderModel) then) =
      _$SliderModelCopyWithImpl<$Res>;
  $Res call({String sliderName, String sliderImage, String sliderId});
}

/// @nodoc
class _$SliderModelCopyWithImpl<$Res> implements $SliderModelCopyWith<$Res> {
  _$SliderModelCopyWithImpl(this._value, this._then);

  final SliderModel _value;
  // ignore: unused_field
  final $Res Function(SliderModel) _then;

  @override
  $Res call({
    Object? sliderName = freezed,
    Object? sliderImage = freezed,
    Object? sliderId = freezed,
  }) {
    return _then(_value.copyWith(
      sliderName: sliderName == freezed
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: sliderImage == freezed
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
      sliderId: sliderId == freezed
          ? _value.sliderId
          : sliderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SliderModelCopyWith<$Res>
    implements $SliderModelCopyWith<$Res> {
  factory _$SliderModelCopyWith(
          _SliderModel value, $Res Function(_SliderModel) then) =
      __$SliderModelCopyWithImpl<$Res>;
  @override
  $Res call({String sliderName, String sliderImage, String sliderId});
}

/// @nodoc
class __$SliderModelCopyWithImpl<$Res> extends _$SliderModelCopyWithImpl<$Res>
    implements _$SliderModelCopyWith<$Res> {
  __$SliderModelCopyWithImpl(
      _SliderModel _value, $Res Function(_SliderModel) _then)
      : super(_value, (v) => _then(v as _SliderModel));

  @override
  _SliderModel get _value => super._value as _SliderModel;

  @override
  $Res call({
    Object? sliderName = freezed,
    Object? sliderImage = freezed,
    Object? sliderId = freezed,
  }) {
    return _then(_SliderModel(
      sliderName: sliderName == freezed
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: sliderImage == freezed
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
      sliderId: sliderId == freezed
          ? _value.sliderId
          : sliderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SliderModel implements _SliderModel {
  _$_SliderModel(
      {required this.sliderName,
      required this.sliderImage,
      required this.sliderId});

  factory _$_SliderModel.fromJson(Map<String, dynamic> json) =>
      _$$_SliderModelFromJson(json);

  @override
  final String sliderName;
  @override
  final String sliderImage;
  @override
  final String sliderId;

  @override
  String toString() {
    return 'SliderModel(sliderName: $sliderName, sliderImage: $sliderImage, sliderId: $sliderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderModel &&
            const DeepCollectionEquality()
                .equals(other.sliderName, sliderName) &&
            const DeepCollectionEquality()
                .equals(other.sliderImage, sliderImage) &&
            const DeepCollectionEquality().equals(other.sliderId, sliderId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sliderName),
      const DeepCollectionEquality().hash(sliderImage),
      const DeepCollectionEquality().hash(sliderId));

  @JsonKey(ignore: true)
  @override
  _$SliderModelCopyWith<_SliderModel> get copyWith =>
      __$SliderModelCopyWithImpl<_SliderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SliderModelToJson(this);
  }
}

abstract class _SliderModel implements SliderModel {
  factory _SliderModel(
      {required String sliderName,
      required String sliderImage,
      required String sliderId}) = _$_SliderModel;

  factory _SliderModel.fromJson(Map<String, dynamic> json) =
      _$_SliderModel.fromJson;

  @override
  String get sliderName;
  @override
  String get sliderImage;
  @override
  String get sliderId;
  @override
  @JsonKey(ignore: true)
  _$SliderModelCopyWith<_SliderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
