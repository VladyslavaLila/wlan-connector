import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/presentation/bloc/wlan_bloc.dart';
import 'package:wlan_connector/presentation/bloc/wlan_event.dart';
import 'package:wlan_connector/presentation/bloc/wlan_state.dart';
import 'package:wlan_connector/presentation/constants/validation_status.dart';
import 'package:wlan_connector/domain/service/connection_service.dart';

class EnterPasswordDialog extends StatelessWidget {
  EnterPasswordDialog({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WlanBloc(ConnectionService()),
      child: BlocConsumer<WlanBloc, WlanState>(listener: (context, state) {
        if (state.validationStatus == ValidationStatus.success) {
          _showSuccessSnackbar(context);
        }

        if (state.validationStatus == ValidationStatus.error) {
          _showErrorSnackbar(context);
        }
      }, builder: (context, state) {
        return AlertDialog(
          title: const Text('Mit einem WLAN verbinden'),
          content: TextField(
            controller: _controller,
            obscureText: state.obscurePassword ?? true,
            decoration: InputDecoration(
              hintText: 'Passwort',
              suffixIcon: IconButton(
                onPressed: () => context.read<WlanBloc>().add(ObscurePasswordEvent(state.obscurePassword ?? true)),
                icon: Icon(state.obscurePassword ?? true ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                context.read<WlanBloc>().add(ValidatePasswordEvent(_controller.text));
                Navigator.of(context).pop();
              },
              child: const Text('Absenden'),
            ),
          ],
        );
      }),
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ihre Anmeldung war erfolgreich!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Es gab ein Problem bei der Anmeldung.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
