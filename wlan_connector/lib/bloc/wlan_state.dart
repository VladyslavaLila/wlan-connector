import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wlan_connector/constants/refresh_status.dart';
import 'package:wlan_connector/constants/validation_status.dart';
import 'package:wlan_connector/model/wlan.dart';

part 'wlan_state.freezed.dart';

@freezed
class WlanState with _$WlanState {
  const factory WlanState({
    RefreshStatus? refreshStatus,
    ValidationStatus? validationStatus,
    List<Wlan>? wlanConnections,
    bool? obscurePassword,
  }) = _WlanState;
}
