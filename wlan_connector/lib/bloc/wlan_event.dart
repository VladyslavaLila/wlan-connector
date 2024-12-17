import 'package:freezed_annotation/freezed_annotation.dart';

part 'wlan_event.freezed.dart';

@freezed
class WlanEvent with _$WlanEvent {
  const factory WlanEvent.getConnections() = GetConnectionsEvent;
  const factory WlanEvent.refreshConnections() = RefreshConnectionsEvent;
  const factory WlanEvent.obscurePassword(bool obscurePassword) = ObscurePasswordEvent;
  const factory WlanEvent.validatePassword(String? password) = ValidatePasswordEvent;
}
