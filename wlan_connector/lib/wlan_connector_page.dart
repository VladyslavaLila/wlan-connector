import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wlan_connector/model/connection_quality.dart';
import 'package:wlan_connector/model/wlan.dart';
import 'package:wlan_connector/widgets/wifi_tile.dart';

class WlanConnectorPage extends StatefulWidget {
  const WlanConnectorPage({super.key});

  @override
  State<WlanConnectorPage> createState() => _WlanConnectorPageState();
}

class _WlanConnectorPageState extends State<WlanConnectorPage> {
  final List<Wlan> _wlanItems = [
    Wlan(name: 'Workspace-WLAN', connectionQuality: ConnectionQuality.low, isLocked: true),
    Wlan(name: 'XYZ_WLAN', connectionQuality: ConnectionQuality.medium, isLocked: true),
    Wlan(name: 'FritzBox 78954320FF2B2345', connectionQuality: ConnectionQuality.heigh, isLocked: false),
    Wlan(name: 'IBelieveWiCanFi', connectionQuality: ConnectionQuality.heigh, isLocked: true),
    Wlan(name: 'Lenas WIFI', connectionQuality: ConnectionQuality.heigh, isLocked: false),
    Wlan(name: 'Lenas WIFI 2', connectionQuality: ConnectionQuality.low, isLocked: true),
    Wlan(name: 'The BestWIFI', connectionQuality: ConnectionQuality.heigh, isLocked: false),
  ];

  List<Wlan> _displayedItems = [
    Wlan(name: 'Workspace-WLAN', connectionQuality: ConnectionQuality.low, isLocked: true),
    Wlan(name: 'XYZ_WLAN', connectionQuality: ConnectionQuality.medium, isLocked: true),
    Wlan(name: 'FritzBox 78954320FF2B2345', connectionQuality: ConnectionQuality.heigh, isLocked: false),
    Wlan(name: 'IBelieveWiCanFi', connectionQuality: ConnectionQuality.heigh, isLocked: true),
    Wlan(name: 'Lenas WIFI', connectionQuality: ConnectionQuality.heigh, isLocked: false),
    Wlan(name: 'Lenas WIFI 2', connectionQuality: ConnectionQuality.low, isLocked: true),
  ];

  bool isLoading = false;

  void _shuffleAndDisplay() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    _wlanItems.shuffle();

    int randomItemCount = Random().nextBool() ? 6 : 8;

    setState(() {
      _displayedItems = _wlanItems.take(randomItemCount).toList();
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WLAN Connector', style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Willkommen!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            const Text(
              'Lass uns beginnen indem wir uns mit einem WLAN verbinden.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _displayedItems.length,
                itemBuilder: (context, index) => WifiTile(name: _displayedItems[index].name),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _shuffleAndDisplay,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
