import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';
// ignore: duplicate_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'coco.dart';
void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  final _username = TextEditingController();
  // ignore: non_constant_identifier_names
  final _Password = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // ignore: unused_element
  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter < 0) {
        _counter = 0;
      }
    });
  }

  // ignore: non_constant_identifier_names
  void _Loging_User() {
    Navigator.of(context).push(
        // ignore: non_constant_identifier_names
        MaterialPageRoute(
            // ignore: non_constant_identifier_names
            builder: (Context) => Next_one(
                  reciveValue_User: _username.text,
                  reciveValue_Password: _Password.text,
                )));
  }
  // ignore: non_constant_identifier_names
  void Next_coco() {
    Navigator.of(context).push(
        // ignore: non_constant_identifier_names
        MaterialPageRoute(
            // ignore: non_constant_identifier_names
            builder: (Context) => const MyApp_covid(
                )));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: 
          Expanded(child: SingleChildScrollView(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40), //////// HERE
                ),
                onPressed: _incrementCounter,
                child: const Text('+'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shadowColor: Colors.redAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40), //////// HERE
                ),
                onPressed: _decrementCounter,
                child: const Text('-'),
              ),
              const SizedBox(
                height: 250,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 15),
                child: Column(
                  children: [
                    TextField(
                      controller: _username,
                      decoration: const InputDecoration(
                          labelText: 'Username', icon: Icon(Icons.person)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: _Password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password', icon: Icon(Icons.vpn_key)),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  shadowColor: Colors.blueAccent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40),
                ),
                onPressed: _Loging_User,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.blueAccent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                  // ignore: prefer_const_constructors
                  minimumSize: Size(100, 40),
                ),
                onPressed: Next_coco,
                child: const Text(
                  'Covid DATA',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),))
        ),// This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// ignore: camel_case_types, must_be_immutable
class Next_one extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String reciveValue_User;
  // ignore: non_constant_identifier_names
  String reciveValue_Password;
  // ignore: non_constant_identifier_names
  Next_one(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.reciveValue_User,
      // ignore: non_constant_identifier_names
      required this.reciveValue_Password})
      : super(key: key);

  @override
  State<Next_one> createState() => _Next_oneState();
}

// ignore: camel_case_types
class _Next_oneState extends State<Next_one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login  to the next one'),
        ),
        body: Center(
          // ignore: unnecessary_const, unnecessary_brace_in_string_interps, unnecessary_string_interpolations
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: unnecessary_brace_in_string_interps
              Text('Username: ${widget.reciveValue_User}'),
              Text('Password: ${widget.reciveValue_Password}'),
            ],
          ),
        ));
  }
}
