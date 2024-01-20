import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  late Widget body;

  PageContainer(this.body);

  @override
  Widget build(BuildContext context) {
    double curWidth = MediaQuery.of(context).size.width;
    if (curWidth >= 768) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('홈'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('설정'),
                ),
              ],
              selectedIndex: 0,
              onDestinationSelected: (int index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/setting');
                }
              },
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child:Center(child: body))
            )
          ]
        )
      );
    }
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