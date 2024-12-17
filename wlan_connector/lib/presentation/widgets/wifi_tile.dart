import 'package:flutter/material.dart';
import 'package:wlan_connector/presentation/constants/connection_quality.dart';
import 'package:wlan_connector/presentation/widgets/enter_password_dialog.dart';

class WifiTile extends StatelessWidget {
  const WifiTile({
    super.key,
    required this.name,
    required this.quality,
    required this.isLocked,
  });

  final String name;
  final ConnectionQuality quality;
  final bool isLocked;

  Future<void> _showTextFieldDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => EnterPasswordDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _showTextFieldDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            _getConnectionIcon(quality, isLocked),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon _getConnectionIcon(ConnectionQuality quality, bool isLocked) {
    if (isLocked) {
      switch (quality) {
        case ConnectionQuality.low:
          return const Icon(Icons.signal_wifi_connected_no_internet_4);
        case ConnectionQuality.medium:
          return const Icon(Icons.signal_wifi_4_bar_lock);
        case ConnectionQuality.high:
          return const Icon(Icons.signal_wifi_4_bar_lock);

        default:
          return const Icon(Icons.wifi_lock_outlined);
      }
    } else {
      switch (quality) {
        case ConnectionQuality.low:
          return const Icon(Icons.signal_wifi_0_bar);
        case ConnectionQuality.medium:
          return const Icon(Icons.wifi_2_bar);
        case ConnectionQuality.high:
          return const Icon(Icons.signal_wifi_4_bar);

        default:
          return const Icon(Icons.wifi);
      }
    }
  }
}
