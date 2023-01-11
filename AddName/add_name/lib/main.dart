import 'package:add_name/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'dart:io';

final _username = TextEditingController();
// ignore: non_constant_identifier_names
final _name = TextEditingController();
final _listview = ScrollController();

List<List<dynamic>> entries = [];

void main() {
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
      home: const MyHomePage(title: 'เพิ่มรายชื่อนักศึกษา'),
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
  // ignore: unused_field
  int _counter = 0;
  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/demoTextFile.txt';
    return filePath;
  }

  void saveFile() async {
    String csvData = const ListToCsvConverter().convert(entries);
    File file = File(await getFilePath());
    file.writeAsString(csvData);
  }

  void loadFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();
    List<List<dynamic>> data = const CsvToListConverter().convert(fileContent);
    setState(() {
      entries = data;
    });
  }

  void _incrementCounter() {
    setState(() {
      entries.add([_username.text, _name.text]);
      _username.text = '';
      _name.text = '';
      if (_listview.hasClients) {
        _listview.animateTo(_listview.position.maxScrollExtent,
            curve: Curves.easeOut, duration: const Duration(milliseconds: 500));
      }
      saveFile();
      loadFile();
    });
  }

  void _Remove(index) {
    setState(() {
      _counter++;
      entries.removeAt(index);
    });
  }

  @override
  void initState() {
    loadFile();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: entries.isNotEmpty
                    ? ListView.builder(
                        controller: _listview,
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          // ignore: sized_box_for_whitespace
                          return Card(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 3, 0, 3),
                              // leading: const Icon(Icons.supervised_user_circle_rounded,size:30),
                              title: Text(
                                '${entries[index].reversed.last} ${entries[index].reversed.first}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _Remove(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    size: 30,
                                    color: Colors.red,
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => MyCamera())));
                              },
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text("No student"),
                      )),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 108),
              child: Column(
                children: [
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      labelText: 'รหัสนักศึกษา',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _name,
                    decoration:
                        const InputDecoration(labelText: 'ชื่อ-นามสกุล'),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          // ignore: sort_child_properties_last
          child: const Icon(
            Icons.add,
          ),
          backgroundColor: Colors.green,
        ));
  }
}
