// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductStateTearOff {
  const _$ProductStateTearOff();

  _ProductState call(
      {List<Product> products = const <Product>[],
      bool hasNext = true,
      bool isLoading = false}) {
    return _ProductState(
      products: products,
      hasNext: hasNext,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $ProductState = _$ProductStateTearOff();

/// @nodoc
mixin _$ProductState {
  List<Product> get products => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res>;
  $Res call({List<Product> products, bool hasNext, bool isLoading});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  final ProductState _value;
  // ignore: unused_field
  final $Res Function(ProductState) _then;

  @override
  $Res call({
    Object? products = freezed,
    Object? hasNext = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(
          _ProductState value, $Res Function(_ProductState) then) =
      __$ProductStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Product> products, bool hasNext, bool isLoading});
}

/// @nodoc
class __$ProductStateCopyWithImpl<$Res> extends _$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(
      _ProductState _value, $Res Function(_ProductState) _then)
      : super(_value, (v) => _then(v as _ProductState));

  @override
  _ProductState get _value => super._value as _ProductState;

  @override
  $Res call({
    Object? products = freezed,
    Object? hasNext = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_ProductState(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductState implements _ProductState {
  const _$_ProductState(
      {this.products = const <Product>[],
      this.hasNext = true,
      this.isLoading = false});

  @JsonKey()
  @override
  final List<Product> products;
  @JsonKey()
  @override
  final bool hasNext;
  @JsonKey()
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ProductState(products: $products, hasNext: $hasNext, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductState &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality().equals(other.hasNext, hasNext) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(hasNext),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$ProductStateCopyWith<_ProductState> get copyWith =>
      __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);
}

abstract class _ProductState implements ProductState {
  const factory _ProductState(
      {List<Product> products, bool hasNext, bool isLoading}) = _$_ProductState;

  @override
  List<Product> get products;
  @override
  bool get hasNext;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$ProductStateCopyWith<_ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
