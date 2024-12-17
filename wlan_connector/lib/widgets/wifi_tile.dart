import 'package:flutter/material.dart';
import 'package:wlan_connector/widgets/enter_password_dialog.dart';

class WifiTile extends StatelessWidget {
  final String name;

  WifiTile({super.key, required this.name});

  Future<void> _showTextFieldDialog(BuildContext context) async {
    await showDialog(context: context, builder: (BuildContext context) => EnterPasswordDialog());
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
            Icon(Icons.wifi_lock_outlined),
            // Icon(Icons.wifi_2_bar),
            // Icon(Icons.signal_wifi_4_bar),
            // Icon(Icons.signal_wifi_4_bar_lock_sharp),
            const SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
