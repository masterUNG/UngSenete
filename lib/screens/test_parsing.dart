import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungsenete/models/address_model.dart';
import 'package:ungsenete/models/shape_model.dart';
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
    // loadStudent();
    // loadAddress();
    loadShape();
  }

  Future<void> loadShape() async {
    String string = await loadShapeAssets();
    print('string ==>> $string');
    var jsonResponse = json.decode(string);
    ShapeModel shapeModel = ShapeModel.fromJson(jsonResponse);
    String shapeName = shapeModel.shapeName;
    print('shapeName = $shapeName');
    var propertyObject = shapeModel.property;
    print('width ==> ${propertyObject.width}');
    print('bredth ==> ${propertyObject.breadth}');
  }

  Future<String> loadShapeAssets() async {
    return await rootBundle.loadString('assets/shape.json');
  }

  Future<void> loadAddress() async {
    String string = await loadAddressAsset();
    print('string = $string');
    var jsonResponse = json.decode(string);
    AddressModel addressModel = AddressModel.fromJson(jsonResponse);
    print('city ==> ${addressModel.city}');
    print('streets ==> ${addressModel.streets}');
    List<String> streetsList = addressModel.streets;
    for (var street in streetsList) {
      print('street ==> $street');
    }
  }

  Future<String> loadAddressAsset() async {
    return await rootBundle.loadString('assets/address.json');
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
