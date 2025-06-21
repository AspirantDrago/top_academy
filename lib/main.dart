import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:top_academy/component/date_selector.dart';
import 'package:top_academy/component/event_list.dart';
import 'package:top_academy/src/api.dart';

import 'component/group_list.dart';
import 'models/data_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Api.initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      darkTheme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: Scaffold(body: HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lastUpdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: updateEvents,
      child: Column(
        children: [
          Center(
            child: Text(
              "список групп:",
              style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          GroupList(),
          DateSelector(),
          Expanded(
            child: Padding(padding: EdgeInsets.all(10), child: EventList(key: DataApp.eventsKey)),
          ),
        ],
      ),
    );
  }

  void updateEvents(details) {
    var curUpdate = DateTime.now();
    if (curUpdate.difference(lastUpdate).inSeconds < 1) {
      return;
    }
    lastUpdate = curUpdate;
    DataApp.eventsKey.currentState?.loadEvents();
  }
}
