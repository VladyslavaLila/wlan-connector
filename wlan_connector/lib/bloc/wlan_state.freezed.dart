// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wlan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WlanState {
  RefreshStatus? get refreshStatus => throw _privateConstructorUsedError;
  ValidationStatus? get validationStatus => throw _privateConstructorUsedError;
  List<Wlan>? get wlanConnections => throw _privateConstructorUsedError;
  bool? get obscurePassword => throw _privateConstructorUsedError;

  /// Create a copy of WlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WlanStateCopyWith<WlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WlanStateCopyWith<$Res> {
  factory $WlanStateCopyWith(WlanState value, $Res Function(WlanState) then) =
      _$WlanStateCopyWithImpl<$Res, WlanState>;
  @useResult
  $Res call(
      {RefreshStatus? refreshStatus,
      ValidationStatus? validationStatus,
      List<Wlan>? wlanConnections,
      bool? obscurePassword});
}

/// @nodoc
class _$WlanStateCopyWithImpl<$Res, $Val extends WlanState>
    implements $WlanStateCopyWith<$Res> {
  _$WlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshStatus = freezed,
    Object? validationStatus = freezed,
    Object? wlanConnections = freezed,
    Object? obscurePassword = freezed,
  }) {
    return _then(_value.copyWith(
      refreshStatus: freezed == refreshStatus
          ? _value.refreshStatus
          : refreshStatus // ignore: cast_nullable_to_non_nullable
              as RefreshStatus?,
      validationStatus: freezed == validationStatus
          ? _value.validationStatus
          : validationStatus // ignore: cast_nullable_to_non_nullable
              as ValidationStatus?,
      wlanConnections: freezed == wlanConnections
          ? _value.wlanConnections
          : wlanConnections // ignore: cast_nullable_to_non_nullable
              as List<Wlan>?,
      obscurePassword: freezed == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WlanStateImplCopyWith<$Res>
    implements $WlanStateCopyWith<$Res> {
  factory _$$WlanStateImplCopyWith(
          _$WlanStateImpl value, $Res Function(_$WlanStateImpl) then) =
      __$$WlanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RefreshStatus? refreshStatus,
      ValidationStatus? validationStatus,
      List<Wlan>? wlanConnections,
      bool? obscurePassword});
}

/// @nodoc
class __$$WlanStateImplCopyWithImpl<$Res>
    extends _$WlanStateCopyWithImpl<$Res, _$WlanStateImpl>
    implements _$$WlanStateImplCopyWith<$Res> {
  __$$WlanStateImplCopyWithImpl(
      _$WlanStateImpl _value, $Res Function(_$WlanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshStatus = freezed,
    Object? validationStatus = freezed,
    Object? wlanConnections = freezed,
    Object? obscurePassword = freezed,
  }) {
    return _then(_$WlanStateImpl(
      refreshStatus: freezed == refreshStatus
          ? _value.refreshStatus
          : refreshStatus // ignore: cast_nullable_to_non_nullable
              as RefreshStatus?,
      validationStatus: freezed == validationStatus
          ? _value.validationStatus
          : validationStatus // ignore: cast_nullable_to_non_nullable
              as ValidationStatus?,
      wlanConnections: freezed == wlanConnections
          ? _value._wlanConnections
          : wlanConnections // ignore: cast_nullable_to_non_nullable
              as List<Wlan>?,
      obscurePassword: freezed == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$WlanStateImpl implements _WlanState {
  const _$WlanStateImpl(
      {this.refreshStatus,
      this.validationStatus,
      final List<Wlan>? wlanConnections,
      this.obscurePassword})
      : _wlanConnections = wlanConnections;

  @override
  final RefreshStatus? refreshStatus;
  @override
  final ValidationStatus? validationStatus;
  final List<Wlan>? _wlanConnections;
  @override
  List<Wlan>? get wlanConnections {
    final value = _wlanConnections;
    if (value == null) return null;
    if (_wlanConnections is EqualUnmodifiableListView) return _wlanConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? obscurePassword;

  @override
  String toString() {
    return 'WlanState(refreshStatus: $refreshStatus, validationStatus: $validationStatus, wlanConnections: $wlanConnections, obscurePassword: $obscurePassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WlanStateImpl &&
            (identical(other.refreshStatus, refreshStatus) ||
                other.refreshStatus == refreshStatus) &&
            (identical(other.validationStatus, validationStatus) ||
                other.validationStatus == validationStatus) &&
            const DeepCollectionEquality()
                .equals(other._wlanConnections, _wlanConnections) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshStatus, validationStatus,
      const DeepCollectionEquality().hash(_wlanConnections), obscurePassword);

  /// Create a copy of WlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WlanStateImplCopyWith<_$WlanStateImpl> get copyWith =>
      __$$WlanStateImplCopyWithImpl<_$WlanStateImpl>(this, _$identity);
}

abstract class _WlanState implements WlanState {
  const factory _WlanState(
      {final RefreshStatus? refreshStatus,
      final ValidationStatus? validationStatus,
      final List<Wlan>? wlanConnections,
      final bool? obscurePassword}) = _$WlanStateImpl;

  @override
  RefreshStatus? get refreshStatus;
  @override
  ValidationStatus? get validationStatus;
  @override
  List<Wlan>? get wlanConnections;
  @override
  bool? get obscurePassword;

  /// Create a copy of WlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WlanStateImplCopyWith<_$WlanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
