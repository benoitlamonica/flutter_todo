import 'package:flutter/material.dart';
import 'theme/theme.dart' as theme;
import 'components/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do',
      theme: theme.main,
      home: MyHomePage(title: 'Remembers'),
    );
  }
}
