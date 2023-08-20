import 'package:flutter/material.dart';


const data = [
  "2023/08/11 10:20 이상치 발견",
  "2023/08/13 20:20 이상치 발견",
  "2023/08/14 10:20 이상치 발견",
  "2023/08/15 20:20 이상치 발견",
  "2023/08/16 10:20 이상치 발견",
  "2023/08/18 20:20 이상치 발견",
  "2023/08/19 10:20 이상치 발견",
];

class DetailCard extends StatefulWidget {
  late String machineName;

  DetailCard(this.machineName);

  @override
  State<StatefulWidget> createState() {
    return _DetailCard(machineName);
  }
}

class _DetailCard extends State<DetailCard> {
  late String machineName;
  _DetailCard(this.machineName);
  bool isHistory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isHistory ? machineName : machineName + "알림 발송 내역"),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              isHistory = !isHistory;
            });
          }, icon: Icon(Icons.history))
        ],
      ),
      body: !isHistory ? _listView() : _logView(),
    );
  }
}


ListView _listView() {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 20,
        child: Text(data[index]),
      );
    },
  );
}
Widget _logView() {
  return Container(
    child: Text("기계 데이터"),
  );
}