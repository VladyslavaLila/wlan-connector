import 'package:flutter/material.dart';

class EnterPasswordDialog extends StatefulWidget {
  const EnterPasswordDialog({super.key});

  @override
  State<EnterPasswordDialog> createState() => _EnterPasswordDialogState();
}

class _EnterPasswordDialogState extends State<EnterPasswordDialog> {
  final TextEditingController _controller = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Mit einem WLAN verbinden'),
      content: TextField(
        controller: _controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: 'Passwort',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility)),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _showSuccessSnackbar(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your submission was successful!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}
