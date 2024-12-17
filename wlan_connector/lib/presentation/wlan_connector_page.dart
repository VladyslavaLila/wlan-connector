import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wlan_connector/presentation/constants/connection_quality.dart';
import 'package:wlan_connector/presentation/constants/get_conenctions_status.dart';
import 'package:wlan_connector/presentation/constants/refresh_status.dart';
import 'package:wlan_connector/presentation/bloc/wlan_bloc.dart';
import 'package:wlan_connector/presentation/bloc/wlan_event.dart';
import 'package:wlan_connector/presentation/bloc/wlan_state.dart';
import 'package:wlan_connector/presentation/widgets/refresh_button.dart';
import 'package:wlan_connector/presentation/widgets/wifi_tile.dart';

class WlanConnectorPage extends StatelessWidget {
  const WlanConnectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WlanBloc, WlanState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('WLAN Connector', style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        body: state.getConnectionsStatus == GetConnectionsStatus.loading
            ? const Center(child: CircularProgressIndicator(color: Colors.black))
            : Padding(
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
                        itemCount: state.wlanConnections?.length,
                        itemBuilder: (context, index) => WifiTile(
                          name: state.wlanConnections?[index].name ?? '',
                          quality: state.wlanConnections?[index].connectionQuality ?? ConnectionQuality.low,
                          isLocked: state.wlanConnections?[index].isLocked ?? false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: RefreshButton(
                            onPressed: state.refreshStatus == RefreshStatus.loading
                                ? null
                                : () {
                                    context.read<WlanBloc>().add(const RefreshConnectionsEvent());
                                  },
                            isLoading: state.refreshStatus == RefreshStatus.loading),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
