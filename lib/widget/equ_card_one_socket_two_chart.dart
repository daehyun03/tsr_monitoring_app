import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tsr_monitoring_app/widget/real_time_chart.dart';

import '../util/detail_screen_argument.dart';

class EquCardOSTC extends StatefulWidget {
  late String machineName;
  late String channelName1;
  late String channelName2;
  late double curWidth;
  late double curHeight;
  EquCardOSTC(this.machineName, this.channelName1, this.channelName2, this.curWidth, this.curHeight);

  @override
  State<StatefulWidget> createState() => _EquCardOSTC(machineName, channelName1, channelName2, curWidth, curHeight);
}

class _EquCardOSTC extends State<EquCardOSTC> {
  late String machineName;
  late String channelName1;
  late String channelName2;
  late double curWidth;
  late double curHeight;
  _EquCardOSTC(this.machineName, this.channelName1, this.channelName2, this.curWidth, this.curHeight);
  late Widget body;

  Widget _makeBody(bool isDetail) {
    if((curWidth < 768) && isDetail) {
      return Container(
          height: curHeight * 0.8,
          child: Column(
            children: [
              Expanded(child: LiveChart(channelName1, curWidth, isDetail)),
              Expanded(child: LiveChart(channelName2, curWidth, isDetail))
            ],
          )
      );
    }
    return Row(
      children: [
        Expanded(child: LiveChart(channelName1, curWidth, isDetail)),
        Expanded(child: LiveChart(channelName2, curWidth, isDetail))
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
    if(curWidth >= 768) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/$machineName', arguments: DetailScreenArgument(machineName, _makeBody(true)));
          },
          child: Container(
            child: Center(
                child: body
            )
          ),
        )
      );
    }
    return Scaffold(
        appBar: AppBar(
          shape: Border.all(color: Colors.black),
          centerTitle: true,
          title: Text(machineName, style: TextStyle(fontWeight: FontWeight.w700)),
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
            child: Center(
                child: body
            )
        )
    );
  }
}
