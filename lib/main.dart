import 'package:flutter/material.dart';
import './root_page.dart';
import './auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WP-Flutter-JSON',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth()),
      debugShowCheckedModeBanner: false,
    );
  }
}
