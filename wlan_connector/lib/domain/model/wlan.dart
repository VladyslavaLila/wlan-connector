import 'package:wlan_connector/presentation/constants/connection_quality.dart';

class Wlan {
  Wlan({required this.name, required this.connectionQuality, required this.isLocked});

  final String name;
  final ConnectionQuality connectionQuality;
  final bool isLocked;
}
