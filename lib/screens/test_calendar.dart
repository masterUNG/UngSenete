import 'package:flutter/material.dart';

class TestCalendar extends StatefulWidget {
  @override
  _TestCalendarState createState() => _TestCalendarState();
}

class _TestCalendarState extends State<TestCalendar> {
  // Field
  DateTime dateTime;
  TimeOfDay timeOfDay;

  // Method
  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    timeOfDay = TimeOfDay.now();
  }

  Widget showDate() {
    return ListTile(
      leading: Icon(Icons.date_range),
      title: Text('${dateTime.year} - ${dateTime.month} - ${dateTime.day}'),
      trailing: Icon(Icons.keyboard_arrow_down),
      onTap: () {
        chooseDate();
      },
    );
  }

  Future<void> chooseDate() async {
    DateTime chooseDateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: dateTime,
    );

    if (chooseDateTime != null) {
      setState(() {
        dateTime = chooseDateTime;
      });
    }
  }

  Widget showTime() {
    return ListTile(
      leading: Icon(Icons.timer),
      title: Text('${timeOfDay.hour} : ${timeOfDay.minute}'),
      trailing: Icon(Icons.keyboard_arrow_down),
      onTap: () {
        chooseTime();
      },
    );
  }

  Future<void> chooseTime() async {
    TimeOfDay chooseTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );

    setState(() {
      timeOfDay = chooseTime;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            showDate(),
            showTime(),
          ],
        ),
      ),
    );
  }
}
