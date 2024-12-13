import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 첫 번째 화면
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}



class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _showDialogMessage(BuildContext context, String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert Dialog"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("확인")),
        ],
      );
    });
  }

  void addCount() {
    setState(() {
      _counter++;

      if (_counter == 10) {
        _showDialogMessage(context, "10회 클릭!");
      }

    });
  }

  void resetCount() {
    setState(() {
      _counter = 0;
      Fluttertoast.showToast(msg: "리셋완료!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("숫자 카운트"),
          Text("$_counter", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {addCount();}, child: Text("클릭")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: () {resetCount();}, child: Text("리셋")),
            ],
          ),
        ],
      ),
    );
  }
}