import 'package:flutter/material.dart';
import 'package:ungsenete/screens/authen.dart';
import 'package:ungsenete/screens/my_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.purple),
      home: MyService(),
    );
  }
}
