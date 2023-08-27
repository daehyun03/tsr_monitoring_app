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

class AnomalyListView extends StatelessWidget {
  const AnomalyListView({super.key});

  @override
  Widget build(BuildContext context) {
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
}