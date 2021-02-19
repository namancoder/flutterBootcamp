import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and Win"),
      ),
      body: Center(
        child: Text("Hardest Game You Will Ever Play"),
      ),
    );
  }
}
