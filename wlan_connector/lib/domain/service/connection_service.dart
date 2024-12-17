import 'package:wlan_connector/presentation/constants/connection_quality.dart';
import 'package:wlan_connector/domain/model/wlan.dart';

class ConnectionService {
  Future<List<Wlan>> getWlanConnections() async {
    await Future.delayed(const Duration(seconds: 1));
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
}
