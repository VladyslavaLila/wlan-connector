import 'dart:math';

import 'package:wlan_connector/constants/refresh_status.dart';
import 'package:wlan_connector/bloc/wlan_event.dart';
import 'package:wlan_connector/bloc/wlan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/constants/connection_quality.dart';
import 'package:wlan_connector/constants/validation_status.dart';
import 'package:wlan_connector/model/wlan.dart';

class WlanBloc extends Bloc<WlanEvent, WlanState> {
  WlanBloc() : super(const WlanState()) {
    on<WlanEvent>(
      (event, emit) async {
        await event.when(
          getConnections: () => _getConnections(emit),
          refreshConnections: () => _refreshConnections(emit),
          obscurePassword: (bool obscurePassword) => _obscurePassword(emit, obscurePassword),
          validatePassword: (String? password) => _validatePassword(emit, password),
        );
      },
    );
  }

  List<Wlan> _getWlanConnections() {
    List<Map<String, dynamic>> rawData = [
      {'name': 'Workspace-WLAN', 'connectionQuality': ConnectionQuality.low, 'isLocked': true},
      {'name': 'XYZ_WLAN', 'connectionQuality': ConnectionQuality.medium, 'isLocked': true},
      {'name': 'FritzBox 78954320FF2B2345', 'connectionQuality': ConnectionQuality.high, 'isLocked': false},
      {'name': 'IBelieveWiCanFi', 'connectionQuality': ConnectionQuality.high, 'isLocked': true},
      {'name': 'Lenas WIFI', 'connectionQuality': ConnectionQuality.high, 'isLocked': false},
      {'name': 'Lenas WIFI 2', 'connectionQuality': ConnectionQuality.low, 'isLocked': true},
      {'name': 'The BestWIFI', 'connectionQuality': ConnectionQuality.high, 'isLocked': false},
    ];

    return rawData.map((data) {
      return Wlan(
        name: data['name'],
        connectionQuality: data['connectionQuality'],
        isLocked: data['isLocked'],
      );
    }).toList();
  }

  Future<void> _obscurePassword(Emitter<WlanState> emit, bool obscurePassword) async {
    emit(state.copyWith(obscurePassword: !(state.obscurePassword ?? true)));
  }

  Future<void> _validatePassword(Emitter<WlanState> emit, String? password) async {
    if (password != null && password.isNotEmpty) {
      emit(state.copyWith(validationStatus: ValidationStatus.success));
    } else {
      emit(state.copyWith(validationStatus: ValidationStatus.error));
    }
  }

  Future<void> _getConnections(Emitter<WlanState> emit) async {
    emit(state.copyWith(wlanConnections: _getWlanConnections()));
  }

  Future<void> _refreshConnections(Emitter<WlanState> emit) async {
    emit(state.copyWith(refreshStatus: RefreshStatus.loading));
    List<Wlan> refreshedConnections = List.from(state.wlanConnections ?? []);
    refreshedConnections.shuffle();
    int randomItemCount = Random().nextBool() ? 6 : 8;
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      refreshStatus: RefreshStatus.success,
      wlanConnections: refreshedConnections.take(randomItemCount).toList(),
    ));
  }
}
