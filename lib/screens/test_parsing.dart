import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungsenete/models/student_model.dart';


class TestParsing extends StatefulWidget {
  @override
  _TestParsingState createState() => _TestParsingState();
}

class _TestParsingState extends State<TestParsing> {
  // Field

  // Method
  @override
  void initState() {
    super.initState();
    loadStudent();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/student.json');
  }

  Future loadStudent() async {
    String jsonString = await _loadAStudentAsset();
    print('jsonString = $jsonString');
    final jsonResponse = json.decode(jsonString);
    StudentModel student = StudentModel.fromJson(jsonResponse);
    print('Name Student = ${student.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Test Parsing'),
    );
  }
}
