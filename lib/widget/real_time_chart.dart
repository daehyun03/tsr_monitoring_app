import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tsr_monitoring_app/util/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class LiveChart extends StatefulWidget {
  late IO.Socket socket;
  late String channelName;
  LiveChart(this.socket, this.channelName, {super.key});
  @override
  _LiveChart createState() => _LiveChart(socket, channelName);
}

class _LiveChart extends State<LiveChart> {
  late IO.Socket socket;
  late String channelName;
  List<_ChartData> chartData = <_ChartData>[];
  double count = 0;
  ChartSeriesController? _chartSeriesController;
  bool isAnomaly = false;
  _LiveChart(this.socket, this.channelName);
  @override
  void initState() {
    super.initState();

    socket.onAny((eventName, data) {
      try {
        if (eventName == ANOMALY_EVENT) {
          setState(() {
            isAnomaly = data[ANOMALY_EVENT];
          });
        } else {
          data[channelName].forEach((value) {
            chartData.add(_ChartData(count, value));
            if (chartData.length == 300) {
              chartData.removeAt(0);
              _chartSeriesController?.updateDataSource(
                  addedDataIndexes: <int>[chartData.length - 1],
                  removedDataIndexes: <int>[0]);
            } else {
              _chartSeriesController?.updateDataSource(
                  addedDataIndexes: <int>[chartData.length - 1]);
            }
            count += 1 / data[channelName].length;
          }
          );
        }
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          SfCartesianChart(
            //title: ChartTitle(text: '실시간 데이터 차트'),
              primaryXAxis: NumericAxis(isVisible: false),
              series: <LineSeries<_ChartData, double>>[
                LineSeries(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y
                )
              ]
          ),
          Wrap(
            spacing: 100,
            children: [
              Text("상태", style: TextStyle(fontSize: 20)),
              _getStateText(),
            ],
          )
        ],
      )
    );
  }

  Text _getStateText() {
    if (isAnomaly) {
      return Text("고장", style: TextStyle(fontSize: 20, color: Colors.red));
    }
    return Text("정상", style: TextStyle(fontSize: 20, color: Colors.green));
  }

  @override
  void dispose() {
    super.dispose();
    socket.close();
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  double x;
  double y;
}