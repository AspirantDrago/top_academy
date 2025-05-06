import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

var redColor = Color.fromRGBO(217, 24, 66, 1.0);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Академия TOP", home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: redColor,
        child: Icon(
          Icons.search,
          size: 50,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text("П31"),
            Text("П41"),
          ],
        )
      )
    );
  }
}

var appBar = AppBar(
  title: Text(
    "Академия TOP Стерлитамак",
    style: TextStyle(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.bold
    ),
  ),
  centerTitle: true,
  backgroundColor: redColor,
);
