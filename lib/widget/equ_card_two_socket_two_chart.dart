import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';


class EquCardTSTC extends StatefulWidget {
  late String machineName;
  late IO.Socket socket1;
  late IO.Socket socket2;
  late String channelName1;
  late String channelName2;
  EquCardTSTC(this.machineName, this.socket1, this.socket2, this.channelName1, this.channelName2, {super.key});

  @override
  State<StatefulWidget> createState() => _EquCardTSTC(machineName, socket1, socket2, channelName1, channelName2);
}

class _EquCardTSTC extends State<EquCardTSTC> {
  late String machineName;
  late IO.Socket socket1;
  late IO.Socket socket2;
  late String channelName1;
  late String channelName2;
  _EquCardTSTC(this.machineName, this.socket1, this.socket2, this.channelName1, this.channelName2);

  Row _makeBody() {
    return Row(
        children: [
          Expanded(child: LiveChart(socket1, channelName1)),
          Expanded(child: LiveChart(socket2, channelName2))
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
