import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/util/detail_screen_argument.dart';
import 'package:tsr_monitoring_app/widget/anomaly_list_view.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: [
              Text(arguments.machineName, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),),
              arguments.body,
              Expanded(child: AnomalyListView(arguments.machineName))
            ],
          ),
    );
  }
}