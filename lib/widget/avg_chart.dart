import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tsr_monitoring_app/util/constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AvgDataChart extends StatefulWidget {
  late String machineName;

  AvgDataChart(this.machineName);

  @override
  State<AvgDataChart> createState() => _AvgDataChart(machineName);

}

class _AvgDataChart extends State<AvgDataChart> {
  late String machineName;
  List<List<_dateAvgData>> data = [];
  DateTime curDate = DateTime.now();
  DateTime today = DateTime.now();

  _AvgDataChart(this.machineName);

  late List channelList;

  @override
  void initState() {
    super.initState();
    channelList = getChanelNameList(machineName);
    getDataList(getIsOneSocket(machineName));
  }

  void getDataList(bool isOneSocket) async {
    if (isOneSocket) {
      getDataList1();
    } else {
      getDataList2();
    }
  }

  void getDataList1() async {
    data = [];
    final url = Uri.parse(BASE_URL + "/stat/hour?machine=" +
        machineNameMap[machineName]! + "&date=" +
        DateFormat(DATE_FORMAT).format(curDate));
    final res = await http.get(url);

    for (int i = 0; i < channelList.length; i++) {
      List list = jsonDecode(res.body)[channelList[i] + "_hour_avg"] as List;
      List<_dateAvgData> tmp = [];
      for (int i = 0; i < list.length; i++) {
        tmp.add(_dateAvgData(DateTime.parse(list[i][0]), list[i][1]));
      }
      data.add(tmp);
    }

    setState(() {
      data = data;
    });
  }

  void getDataList2() async {
    data = [];
    for (int i = 0; i < channelList.length; i++) {
      final url = Uri.parse(BASE_URL + "/stat/hour?machine=" +
          machineNameMap[machineName + (i + 1).toString()]! + "&date=" +
          DateFormat(DATE_FORMAT).format(curDate));
      final res = await http.get(url);
      List list = jsonDecode(res.body)[channelList[i] + "_hour_avg"] as List;
      List<_dateAvgData> tmp = [];
      for (int i = 0; i < list.length; i++) {
        tmp.add(_dateAvgData(DateTime.parse(list[i][0]), list[i][1]));
      }
      data.add(tmp);
    }

    setState(() {
      data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('일일 평균 조회     ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 20)),
                  ),
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: curDate,
                        firstDate: DateTime(2023),
                        lastDate: today,
                        initialEntryMode: DatePickerEntryMode.calendarOnly);
                    if (selectedDate != null) {
                      setState(() {
                        curDate = selectedDate;
                        getDataList(getIsOneSocket(machineName));
                      });
                    }
                  },
                  child: Text(DateFormat(DATE_FORMAT).format(curDate)),
                ),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(child: _buildChart())
        ]
    );
  }

  Widget _buildChart() {
    if (data.isEmpty) {
      return const Text("데이터가 없습니다.");
    } else {
      return SfCartesianChart(
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: DateTimeCategoryAxis(dateFormat: DateFormat("HH")),
        //primaryYAxis: NumericAxis(interval: 0.1),
        series: <CartesianSeries<_dateAvgData, DateTime>>[
          for (int i = 0; i < channelList.length; i++)
            LineSeries<_dateAvgData, DateTime>(
                name: channelList[i],
                dataSource: data[i],
                xValueMapper: (_dateAvgData data, _) => data.date,
                yValueMapper: (_dateAvgData data, _) => data.avg,
                dataLabelSettings: DataLabelSettings(isVisible: true)
            ),
        ]
      );
    }
  }
}

class _dateAvgData {
  final DateTime date;
  final double avg;

  _dateAvgData(this.date, this.avg);
}
