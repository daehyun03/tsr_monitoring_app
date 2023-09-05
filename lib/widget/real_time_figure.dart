
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
    return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: FittedBox ( fit: BoxFit.fitWidth, child:
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
              ]
            ))
            ),
      ]
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
