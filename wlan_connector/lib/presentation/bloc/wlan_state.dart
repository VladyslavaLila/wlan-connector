import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wlan_connector/presentation/constants/refresh_status.dart';
import 'package:wlan_connector/presentation/constants/validation_status.dart';
import 'package:wlan_connector/domain/model/wlan.dart';

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
