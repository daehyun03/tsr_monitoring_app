import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsr_monitoring_app/util/constants.dart';
import 'package:http/http.dart' as http;

//더미데이터
const data = [
  [
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],
  [
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],[
    "2023-08-21 00:00:00.385910",
    1000.0,
    1210.0
  ],
];

class AnomalyData {
  final String date;
  final double threshold;
  final double score;

  AnomalyData(this.date, this.threshold, this.score);
}

class AnomalyListView extends StatefulWidget {
  late String machineName;

  AnomalyListView(this.machineName);

  @override
  _AnomalyListView createState() => _AnomalyListView(machineName);
}

class _AnomalyListView extends State<AnomalyListView> {
  late String machineName;
  DateTime curDate = DateTime.now();
  DateTime _startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime _endDate = DateTime.now();
  List dataList = [];

  _AnomalyListView(this.machineName);

  @override
  void initState() {
    super.initState();
    getDataList();
  }

  String getUrl() {
    String url = BASE_URL + "/stat/anomaly?machine=" + machineNameMap[machineName]! + "&start=" + DateFormat(DATE_FORMAT).format(_startDate)
      +"&end=" +DateFormat(DATE_FORMAT).format(_endDate);
    print(url);
    return url;
  }

  void getDataList() async{
    dataList = [];/*
    final url = Uri.parse(getUrl());
    final res = await http.get(url);
    List list = jsonDecode(res.body)['anomaly'] as List;*/

    // 삭제 예정
    List list = data;
    getUrl();

    for(int i=0; i<list.length; i++){
        dataList.add(new AnomalyData(
            list[i][0],
            list[i][1],
            list[i][2]
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return(
    Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('이상 이력 조회', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () async{
                      final selectedDate = await showDatePicker(context: context, initialDate: _startDate, firstDate: DateTime(2023), lastDate: curDate,
                          initialEntryMode: DatePickerEntryMode.calendarOnly);
                      if (selectedDate != null) {
                        setState(() {
                          _startDate = selectedDate;
                          getDataList();
                        });
                      }
                    },
                    child: Text(DateFormat(DATE_FORMAT).format(_startDate)),
                  ),
                ),
              Text("~"),
              Container(
                child: ElevatedButton(
                  onPressed: () async{
                    final selectedDate = await showDatePicker(context: context, initialDate: curDate, firstDate: DateTime(2023), lastDate: curDate,
                        initialEntryMode: DatePickerEntryMode.calendarOnly);
                    if (selectedDate != null) {
                      setState(() {
                        _endDate = selectedDate;
                        getDataList();
                      });
                    }
                  },
                  child: Text(DateFormat(DATE_FORMAT).format(_endDate)),
                ),
              )
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildAlertRow(context, dataList[index]);
              },
            ),
          ),
        ], //children
      ),
    )
    );
  }

  Widget _buildAlertRow(BuildContext context, AnomalyData data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(data.date)),
            Align(alignment: Alignment.centerRight, child: Text('이상치 발견 : ${data.score}/${data.threshold}')),
          ],
        ),
      ),
    );
  }
}
