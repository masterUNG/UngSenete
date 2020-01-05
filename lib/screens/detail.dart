import 'package:flutter/material.dart';
import 'package:ungsenete/models/data_model.dart';

class Detail extends StatefulWidget {
  final DataModel dataModel;
  Detail({Key key, this.dataModel});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // Field
  DataModel currentModel;

  // Method
  @override
  void initState() {
    super.initState();
    currentModel = widget.dataModel;
  }

  Widget showTitle() {
    return Text('${currentModel.numberTH}');
  }

  Widget showTitleDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(margin: EdgeInsets.only(right: 16.0),
          child: Text('${currentModel.dataTitle}'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[showTitleDetail()],
        title: showTitle(),
      ),
      body: showContent(),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              currentModel.dataDetail,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
