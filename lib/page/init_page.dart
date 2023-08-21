import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/widget/detail_card.dart';

const machineList = [
  "쇼트블라스트", "인산염피막기", "비형상도포기", "전공펌프"
];
const double maxWidth = 1100;

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double curWidth = MediaQuery.of(context).size.width;
    print(curWidth);
    if (curWidth > maxWidth) {
      curWidth = maxWidth;
      print(curWidth);

    }
    double curHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('TSR 모니터링 시스템'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _body(curWidth, curHeight)
    );
  }
}

Widget _body(double curWidth, double curHeight) {
  double itemH = (curHeight - kToolbarHeight - 24) / 2;
  double itemW = curWidth / 2;
  if(curWidth >= 768) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: itemW / itemH,
      children: List.generate(machineList.length, (index) {
        return Container(
          height: curHeight*0.1,
          child: DetailCard(machineList[index]),
        );
      })
    );
  } else {
    return ListView.builder(
      itemCount: machineList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: curHeight * 0.33,
          child: DetailCard(machineList[index]),
        );
      },
    );
  }
}