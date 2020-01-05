import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungsenete/models/data_model.dart';
import 'package:ungsenete/screens/detail.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  String url =
      'http://w3c.senate.go.th/dbrulessenate/search_senate2562.php?kw=';
  List<DataModel> dataModels = List();
  String search = '';
  final formKey = GlobalKey<FormState>();

  // Method
  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String url2 = '$url$search';

    if (dataModels.length != 0) {
      dataModels.removeWhere((DataModel dataModel) {
        return dataModel != null;
      });
    }

    Response response = await Dio().get(url2);
    var result = json.decode(response.data);
    print('result ===>>> $result');

    for (var map in result) {
      DataModel dataModel = DataModel.fromJson(map);
      setState(() {
        dataModels.add(dataModel);
      });
    }
  }

  Widget showNumberTH(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 30.0,
          ),
          child: Text(
            dataModels[index].numberTH,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Widget showTitle(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 30.0,
          ),
          child: Text(
            dataModels[index].dataTitle,
            style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Widget showTitleDetail(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 30.0,
          ),
          width: MediaQuery.of(context).size.width - 30,
          child: Text(
            dataModels[index].dataTitledetail,
            style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Widget showDetail(int index) {
    String string = dataModels[index].dataDetail;
    if (string.length > 80) {
      string = string.substring(0, 79);
      string = '$string ...';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          width: MediaQuery.of(context).size.width - 30,
          child: Text(
            string,
            style: TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Widget showListView(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext buildContext) {
            return Detail(
              dataModel: dataModels[index],
            );
          });
          Navigator.of(context).push(materialPageRoute);
        },
        child: Card(
          color: index % 2 == 0 ? Colors.grey.shade300 : Colors.grey.shade100,
          child: Column(
            children: <Widget>[
              showNumberTH(index),
              showTitle(index),
              showTitleDetail(index),
              showDetail(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchButton() {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        formKey.currentState.save();
      },
    );
  }

  Widget searchForm() {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white30,
        ),
        child: TextFormField(
          onSaved: (String string) {
            search = string.trim();
            readAllData();
          },
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[searchButton()],
        title: searchForm(),
      ),
      body: ListView.builder(
        itemCount: dataModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return showListView(index);
        },
      ),
    );
  }
}
