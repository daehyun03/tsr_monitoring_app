import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const data = [
  "2023/08/19 10:20 이상치 발견",
  "2023/08/18 20:20 이상치 발견",
  "2023/08/17 10:20 이상치 발견",
  "2023/08/16 20:20 이상치 발견",
  "2023/08/15 10:20 이상치 발견",
  "2023/08/14 20:20 이상치 발견",
  "2023/08/13 10:20 이상치 발견",
];
class AnomalyData {
  final String date;
  final double threshold;
  final double score;

  AnomalyData(this.date, this.threshold, this.score);
}

class AnomalyListView extends StatefulWidget {

  @override
  _AnomalyListView createState() => _AnomalyListView();
}

class _AnomalyListView extends State<AnomalyListView> {
  DateTime _startDate = DateTime(DateTime.now().day - 30);
  DateTime _endDate = DateTime(DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    /*return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 30,
          child: Center(
              child: Text(data[index])
          ),
        );
      },
    );*/
    return(
      Container(
      )
    );
  }
}