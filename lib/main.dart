import 'package:flutter/material.dart';
import 'package:top_academy/component/dateSelector.dart';
import 'package:top_academy/component/eventList.dart';

import 'component/groupList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Center(
                child: Text(
                    "список групп:",
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.underline
                    )
                )
            ),
            GroupList(),
            DateSelector(),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: EventList()
                )
            )
          ],
        )
    );
  }
}

