import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/widget/real_time_figure.dart';


const data = [
  "2023/08/19 10:20 이상치 발견",
  "2023/08/18 20:20 이상치 발견",
  "2023/08/17 10:20 이상치 발견",
  "2023/08/16 20:20 이상치 발견",
  "2023/08/15 10:20 이상치 발견",
  "2023/08/14 20:20 이상치 발견",
  "2023/08/13 10:20 이상치 발견",
];

class DetailCard extends StatefulWidget {
  late String machineName;

  DetailCard(this.machineName, {super.key});

  @override
  State<StatefulWidget> createState() => _DetailCard(machineName);
}

class _DetailCard extends State<DetailCard> {
  late String machineName;
  _DetailCard(this.machineName);
  bool isHistory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        centerTitle: true,
        title: Text(isHistory ? machineName : "$machineName 알림 발송 내역", style: TextStyle(fontWeight: FontWeight.w700),),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              isHistory = !isHistory;
            });
          }, icon: const Icon(Icons.history))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
          child: Center(
            child: !isHistory ? _listView() : _logView(),
          )
      )
    );
  }
}


ListView _listView() {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: 30,
        child: Center(
            child: Text(data[index])
        ),
      );
    },
  );
}
Widget _logView() {
  return RealTimeFigure();
}