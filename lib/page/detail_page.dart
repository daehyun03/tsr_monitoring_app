import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/util/detail_screen_argument.dart';
import 'package:tsr_monitoring_app/widget/anomaly_list_view.dart';

import '../widget/avg_chart.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    double curWidth = MediaQuery.of(context).size.width;
    if (curWidth >= 768) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(arguments.machineName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),),
            arguments.body,
            Expanded(child: Row(
              children: [
                Expanded(child: Padding(padding:const EdgeInsets.all(10), child: AvgDataChart(arguments.machineName))),
                Expanded(child: Padding(padding:const EdgeInsets.all(10), child: AnomalyListView(arguments.machineName))),
              ]
            ))
          ],
        ),
      );
    } else {
      return Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: [
              Align(alignment: Alignment.center, child: Text(arguments.machineName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),),),
              arguments.body,
              AvgDataChart(arguments.machineName),
              AnomalyListView(arguments.machineName)
            ]
          )
      );
    }
  }
}