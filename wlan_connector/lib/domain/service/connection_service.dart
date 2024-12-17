import 'dart:math';

import 'package:wlan_connector/presentation/constants/connection_quality.dart';
import 'package:wlan_connector/domain/model/wlan.dart';

class ConnectionService {
  List<Map<String, dynamic>> rawData = [
    {'name': 'Workspace-WLAN', 'connectionQuality': ConnectionQuality.low, 'isLocked': true},
    {'name': 'XYZ_WLAN', 'connectionQuality': ConnectionQuality.medium, 'isLocked': true},
    {'name': 'FritzBox 78954320FF2B2345', 'connectionQuality': ConnectionQuality.medium, 'isLocked': false},
    {'name': 'IBelieveWiCanFi', 'connectionQuality': ConnectionQuality.high, 'isLocked': true},
    {'name': 'Lenas WIFI', 'connectionQuality': ConnectionQuality.high, 'isLocked': false},
    {'name': 'Lenas WIFI 2', 'connectionQuality': ConnectionQuality.low, 'isLocked': true},
    {'name': 'The BestWIFI', 'connectionQuality': ConnectionQuality.high, 'isLocked': false},
  ];

  Future<List<Wlan>> getWlanConnections() async {
    await Future.delayed(const Duration(seconds: 1));

    return rawData.map((data) {
      return Wlan(
        name: data['name'],
        connectionQuality: data['connectionQuality'],
        isLocked: data['isLocked'],
      );
    }).toList();
  }

  Future<List<Wlan>> refreshWlanConnections() async {
   rawData.shuffle();
    int randomItemCount = Random().nextBool() ? 6 : 8;
    await Future.delayed(const Duration(seconds: 1));

    return rawData.map((data) {
      return Wlan(
        name: data['name'],
        connectionQuality: data['connectionQuality'],
        isLocked: data['isLocked'],
      );
    }).toList().take(randomItemCount).toList();
  }
}
