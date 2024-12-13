import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _counter = 0;

  void _showAlertDialog(BuildContext context, String message){
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert Dialog Test"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("확인")),
        ],
      );
    });
  }

  void _addCount() {
    setState(() {
      _counter++;
    });

    if (_counter == 10){
      _showAlertDialog(context, "10회 클릭!");
    }
  }

  void _resetCount() {
    setState(() {
      _counter = 0;
      _showAlertDialog(context, "리셋 완료");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST!!"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            Text("버튼 누른 횟수", style: TextStyle(fontSize: 20)),
            Text('$_counter', style: TextStyle(fontSize: 30)), // 카운터 크기 조정
            SizedBox(height: 20), // 간격 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 버튼을 중앙에 정렬
              children: [
                ElevatedButton(
                  onPressed: _addCount,
                  child: Text("클릭"),
                ),
                SizedBox(width: 20), // 버튼 간격 추가
                ElevatedButton(
                  onPressed: _resetCount,
                  child: Text("리셋"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
