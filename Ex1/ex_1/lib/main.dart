import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int x = 0;
  // ignore: deprecated_member_use
  String lan = "You have pushed the button this many times:";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _language() {
    setState(() {
      x++;
      if (x % 2 == 0) {
        lan = "You have pushed the button this many times:";
      } else {
        lan = "คุณได้กดปุ่มนี้หลายครั้ง:";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // ignore: unnecessary_string_interpolations
              '$lan',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: _language,
          // ignore: prefer_const_constructors, sort_child_properties_last
          child: Icon(
            Icons.translate,
            size: 40,
          ),
          // ignore: prefer_const_constructors
          backgroundColor: Color.fromARGB(255, 249, 134, 2),
          heroTag: "fab2",
        ),
        const SizedBox(
          width: 100,
        ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.add,
            size: 40,
          ),
          backgroundColor: const Color.fromARGB(255, 56, 154, 47),
          heroTag: "fab1",
        ),
      ]),
    );
  }
}
