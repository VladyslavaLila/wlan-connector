import 'dart:developer';

import 'package:wlan_connector/presentation/constants/get_conenctions_status.dart';
import 'package:wlan_connector/presentation/constants/refresh_status.dart';
import 'package:wlan_connector/presentation/bloc/wlan_event.dart';
import 'package:wlan_connector/presentation/bloc/wlan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/presentation/constants/validation_status.dart';
import 'package:wlan_connector/domain/service/connection_service.dart';

class WlanBloc extends Bloc<WlanEvent, WlanState> {
  final ConnectionService _connectionService;

  WlanBloc(this._connectionService) : super(const WlanState()) {
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
    try {
      emit(state.copyWith(getConnectionsStatus: GetConnectionsStatus.loading));
      final connections = await _connectionService.getWlanConnections();
      emit(state.copyWith(getConnectionsStatus: GetConnectionsStatus.success, wlanConnections: connections));
    } catch (e) {
      emit(state.copyWith(getConnectionsStatus: GetConnectionsStatus.error));
      log("WLAN BLOC. Failed to get connectios: $e");
    }
  }

  Future<void> _refreshConnections(Emitter<WlanState> emit) async {
    try {
      emit(state.copyWith(refreshStatus: RefreshStatus.loading));
      final refreshedConnections = await _connectionService.refreshWlanConnections();
      emit(state.copyWith(
        refreshStatus: RefreshStatus.success,
        wlanConnections: refreshedConnections,
      ));
    } catch (e) {
      emit(state.copyWith(getConnectionsStatus: GetConnectionsStatus.error));
      log("WLAN BLOC. Failed to refresh connectios: $e");
    }
  }
}
