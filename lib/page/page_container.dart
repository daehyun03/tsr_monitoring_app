import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  late Widget body;
  PageContainer(this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TSR 모니터링 시스템', style: TextStyle(fontWeight: FontWeight.w900),),
          centerTitle: true,
          elevation: 5.0,
        ),
        body: body
    );
  }
}