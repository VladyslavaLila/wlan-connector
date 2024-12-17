import 'dart:math';

import 'package:wlan_connector/presentation/constants/refresh_status.dart';
import 'package:wlan_connector/presentation/bloc/wlan_event.dart';
import 'package:wlan_connector/presentation/bloc/wlan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/presentation/constants/validation_status.dart';
import 'package:wlan_connector/domain/model/wlan.dart';
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
    final connections = await _connectionService.getWlanConnections();
    emit(state.copyWith(wlanConnections: connections));
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
