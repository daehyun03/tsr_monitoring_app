import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/widget/anomaly_list_view.dart';
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class EquCardOSOC extends StatefulWidget {
  late String machineName;
  late IO.Socket socket;
  late String channelName;

  EquCardOSOC(this.machineName, this.socket, this.channelName, {super.key});

  @override
  State<StatefulWidget> createState() => _EquCardOSOC(machineName, socket, channelName);
}

class _EquCardOSOC extends State<EquCardOSOC> {
  late IO.Socket socket;
  late String machineName;
  late String channelName;
  _EquCardOSOC(this.machineName, this.socket, this.channelName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        centerTitle: true,
        title: Text(machineName, style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
          child: Center(
            child: LiveChart(socket, channelName),
          )
      )
    );
  }
}