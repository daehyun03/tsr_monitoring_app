import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/util/detail_screen_argument.dart';
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class EquCardOSOC extends StatefulWidget {
  late String machineName;
  late IO.Socket socket;
  late String channelName;
  late double curWidth;

  EquCardOSOC(this.machineName, this.socket, this.channelName, this.curWidth,);

  @override
  State<StatefulWidget> createState() => _EquCardOSOC(machineName, socket, channelName, curWidth);
}

class _EquCardOSOC extends State<EquCardOSOC> {
  late IO.Socket socket;
  late String machineName;
  late double curWidth;
  late String channelName;
  _EquCardOSOC(this.machineName, this.socket, this.channelName, this.curWidth);
  late LiveChart liveChart;

  @override
  void initState() {
    liveChart = LiveChart(socket, channelName, curWidth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        centerTitle: true,
        title: Text(machineName, style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/$machineName', arguments: DetailScreenArgument(machineName, LiveChart(socket, channelName, curWidth)));
            },
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
          child: Center(
            child: liveChart
          )
      )
    );
  }
}