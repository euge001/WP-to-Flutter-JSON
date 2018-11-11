import 'package:flutter/material.dart';
import './top_tab.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "wpflutterjson",
          style: new TextStyle(
            fontFamily: 'Ubuntu',
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: PageView(
        children: <Widget>[
          TopTab()
        ],
      ),
    );
  }
}

