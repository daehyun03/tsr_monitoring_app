import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';

import '../util/detail_screen_argument.dart';

class EquCardOSTC extends StatefulWidget {
  late String machineName;
  late IO.Socket socket;
  late String channelName1;
  late String channelName2;
  late double curWidth;
  late double curHeight;
  EquCardOSTC(this.machineName, this.socket, this.channelName1, this.channelName2, this.curWidth, this.curHeight);

  @override
  State<StatefulWidget> createState() => _EquCardOSTC(machineName, socket, channelName1, channelName2, curWidth, curHeight);
}

class _EquCardOSTC extends State<EquCardOSTC> {
  late String machineName;
  late IO.Socket socket;
  late String channelName1;
  late String channelName2;
  late double curWidth;
  late double curHeight;
  _EquCardOSTC(this.machineName, this.socket, this.channelName1, this.channelName2, this.curWidth, this.curHeight);
  late Widget body;

  Widget _makeBody(bool isDetail) {
    if((curWidth < 768) && isDetail) {
      return Container(
          height: curHeight * 0.8,
          child: Column(
            children: [
              Expanded(child: LiveChart(socket, channelName1)),
              Expanded(child: LiveChart(socket, channelName2))
            ],
          )
      );
    }
    return Row(
      children: [
        Expanded(child: LiveChart(socket, channelName1)),
        Expanded(child: LiveChart(socket, channelName2))
      ],
    );
  }

  @override
  void initState() {
    body = _makeBody(false);
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
                Navigator.of(context).pushNamed('/$machineName', arguments: DetailScreenArgument(machineName, _makeBody(true)));
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
                child: body
            )
        )
    );
  }
}
