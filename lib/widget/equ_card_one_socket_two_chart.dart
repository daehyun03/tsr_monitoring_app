import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';

class EquCardOSTC extends StatefulWidget {
  late String machineName;
  late IO.Socket socket;
  late String channelName1;
  late String channelName2;
  EquCardOSTC(this.machineName, this.socket, this.channelName1, this.channelName2, {super.key});

  @override
  State<StatefulWidget> createState() => _EquCardOSTC(machineName, socket, channelName1, channelName2);
}

class _EquCardOSTC extends State<EquCardOSTC> {
  late String machineName;
  late IO.Socket socket;
  late String channelName1;
  late String channelName2;
  _EquCardOSTC(this.machineName, this.socket, this.channelName1, this.channelName2);

  Row _makeBody() {
    return Row(
      children: [
        Expanded(child: LiveChart(socket, channelName1)),
        Expanded(child: LiveChart(socket, channelName2))
      ],
    );
  }

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
                child: _makeBody()
            )
        )
    );
  }
}
