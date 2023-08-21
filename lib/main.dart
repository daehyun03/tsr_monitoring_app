import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/page/init_page.dart';
import 'package:tsr_monitoring_app/util/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TSR Monitoring App',
      routes: {
        '/' : (context) => InitPage()
      },
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.lightGreen),
        fontFamily: "neo"
      ),
    );
  }
}
