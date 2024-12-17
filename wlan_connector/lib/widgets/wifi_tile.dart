import 'package:flutter/material.dart';
import 'package:wlan_connector/widgets/enter_password_dialog.dart';

class WifiTile extends StatelessWidget {
  final String name;
  final bool obscureText;
  final VoidCallback obscurePassword;

  const WifiTile({
    super.key,
    required this.name,
    required this.obscureText,
    required this.obscurePassword,
  });

  Future<void> _showTextFieldDialog(BuildContext context, bool obscureText, VoidCallback obscurePassword) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => EnterPasswordDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _showTextFieldDialog(context, obscureText, obscurePassword);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.wifi_lock_outlined),
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
}
