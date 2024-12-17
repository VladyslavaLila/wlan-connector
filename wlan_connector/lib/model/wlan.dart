import 'package:wlan_connector/model/connection_quality.dart';

class Wlan {
  Wlan({required this.name, required this.connectionQuality, required this.isLocked});

  final String name;
  final ConnectionQuality connectionQuality;
  final bool isLocked;
}
