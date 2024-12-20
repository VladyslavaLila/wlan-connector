import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/presentation/bloc/wlan_bloc.dart';
import 'package:wlan_connector/presentation/bloc/wlan_event.dart';
import 'package:wlan_connector/domain/service/connection_service.dart';
import 'package:wlan_connector/presentation/wlan_connector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => WlanBloc(ConnectionService())..add(const GetConnectionsEvent()),
        child: const WlanConnectorPage(),
      ),
    );
  }
}
