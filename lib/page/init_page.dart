import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/widget/equ_card_one_socket_one_chart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../util/constants.dart';
import '../widget/equ_card_one_socket_two_chart.dart';
import '../widget/equ_card_two_socket_two_chart.dart';


class InitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InitPage();
  }
}

class _InitPage extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    double curWidth = MediaQuery.of(context).size.width;
    double curHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('TSR 모니터링 시스템', style: TextStyle(fontWeight: FontWeight.w900),),
          centerTitle: true,
          elevation: 5.0,
        ),
        body: _body(curWidth, curHeight, machineList)
    );
  }
}

Widget _body(double curWidth, double curHeight, List machineList) {
  double itemH = (curHeight - kToolbarHeight) / 2;
  double itemW = curWidth / 2;
  //if(curWidth >= 768) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: itemW / itemH,
      children: <Widget> [
        EquCardOSOC(machineList[0], createSocket(BASE_URL+SHOT_BLAST_URL), SHOT_BLAST_CHANNEL_NAME),
        EquCardOSTC(machineList[1], createSocket(BASE_URL+ARO_PUMP_URL), ARO_PUMP1_CHANNEL_NAME, ARO_PUMP2_CHANNEL_NAME),
        EquCardOSOC(machineList[2], createSocket(BASE_URL+DISPENSING_MACHINE_URL), DISPENSING_MACHINE_CHANNEL_NAME),
        EquCardTSTC(machineList[3], createSocket(BASE_URL+VACUUM_PUMP1_URL), createSocket(BASE_URL+VACUUM_PUMP2_URL), VACUUM_PUMP1_CHANNEL_NAME, VACUUM_PUMP2_CHANNEL_NAME),

      ]
    );
  /*} else {
    return ListView.builder(
      itemCount: machineList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: curHeight * 0.47,
          child: DetailCard(machineList[index]),
        );
      },
    );
  }*/
}

IO.Socket createSocket(String url) {
  IO.Socket socket = IO.io(url,
  IO.OptionBuilder().setTransports(['websocket']).build());
  print("$url create socket");
  return socket;
}