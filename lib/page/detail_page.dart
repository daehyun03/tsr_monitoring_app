import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/util/detail_screen_argument.dart';
import 'package:tsr_monitoring_app/widget/anomaly_list_view.dart';

import '../widget/real_time_figure.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    double curWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: [
              Text(arguments.machineName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),),
              arguments.body,
              Expanded(
                  child: _makeUnderBody(arguments.machineName, curWidth)
              )
            ],
          ),
    );
  }

  Widget _makeUnderBody(String machineName, double curWidth) {
    if (curWidth >= 768) {
      return Row(
        children: [
          Expanded(child: AnomalyListView(machineName)),
          Expanded(child: RealTimeFigure())
        ]
      );
    } else {
      return Column(
        children: [
          Expanded(child: AnomalyListView(machineName)),
          Expanded(child: RealTimeFigure())
        ]
      );
    }
  }
}