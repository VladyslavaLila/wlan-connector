import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key, this.onPressed, required this.isLoading});

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        backgroundColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 5,
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.black)
          : const Text(
              'Neu Laden',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
