import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tsr_monitoring_app/util/constants.dart';
import 'package:intl/intl.dart';

class AvgDataChart extends StatefulWidget {
  late String machineName;

  AvgDataChart(this.machineName);

  @override
  _AvgDataChart createState() => _AvgDataChart(machineName);

}

class _AvgDataChart extends State<AvgDataChart> {
  late String machineName;
  List<_dateAvgData> data = [];
  _AvgDataChart(this.machineName);

  @override
  void initState() {
    super.initState();

    //더미데이터 생성
    for (int i = 0; i < 200; i++) {
      data.add(_dateAvgData(DateTime.now().subtract(Duration(days: i)), i.toDouble(), i.toDouble() + 10));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<_dateAvgData, String>>[
                LineSeries<_dateAvgData, String>(
                    dataSource: data,
                    xValueMapper: (_dateAvgData data, _) => DateFormat(DATE_FORMAT).format(data.date),
                    yValueMapper: (_dateAvgData data, _) => data.avg,
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
                LineSeries<_dateAvgData, String>(
                    dataSource: data,
                    xValueMapper: (_dateAvgData data, _) => DateFormat(DATE_FORMAT).format(data.date),
                    yValueMapper: (_dateAvgData data, _) => data.avg2,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
            ]
          ),
      ]
    );
  }
}

class _dateAvgData {
  final DateTime date;
  final double avg;
  final double avg2;

  _dateAvgData(this.date, this.avg, this.avg2);
}
