import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class RealTimeFigure extends StatelessWidget {
  List<_SalesData> data = [
    _SalesData('1', 35),
    _SalesData('2', 28),
    _SalesData('3', 34),
    _SalesData('4', 32),
    _SalesData('5', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: '실시간 진동 차트'),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'test',
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
            const Center(
              child: Wrap(
                spacing: 100,
                children: [
                  Text("상태", style: TextStyle(fontSize: 20)),
                  Text("정상", style: TextStyle(fontSize: 20, color: Colors.green))
                ],
              ),
            )
      ])
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}