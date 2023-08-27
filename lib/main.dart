import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/page/init_page.dart';
import 'package:tsr_monitoring_app/util/color.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //디버그 모드 체크 배터 삭제 예정
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