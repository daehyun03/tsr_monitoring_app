import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/util/detail_screen_argument.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.machineName),
      ),
      body: arguments.body,
    );
  }
}