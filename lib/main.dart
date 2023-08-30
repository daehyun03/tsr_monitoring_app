import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tsr_monitoring_app/page/detail_page.dart';
import 'package:tsr_monitoring_app/page/init_page.dart';
import 'package:tsr_monitoring_app/page/page_container.dart';
import 'package:tsr_monitoring_app/util/color.dart';
import 'package:tsr_monitoring_app/util/fcm_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fcmSetting();
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
      initialRoute: '/',
      routes: {
        '/' : (context) => PageContainer(InitPage()),
        '/쇼트블라스트' : (context) => PageContainer(DetailPage()),
        '/인산염피막기' : (context) => PageContainer(DetailPage()),
        '/비형상도포기' : (context) => PageContainer(DetailPage()),
        '/진공펌프' : (context) => PageContainer(DetailPage()),


      },
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.lightGreen),
        fontFamily: "neo"
      ),
    );
  }
}