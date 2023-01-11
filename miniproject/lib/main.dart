import 'package:flutter/material.dart';
import 'package:miniproject/view/Home.dart';
import 'package:miniproject/view/Upload.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentindex=0;
  final tabs=[
     Home(),
    Upload(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Songs App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home:Scaffold(
        appBar: AppBar(
          title: const Text("Songs App"),
        ),
        body:tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
             label: "Home",
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
               label: "Upload",
            ),
          ],
          onTap: (index){
            setState(() {
              _currentindex=index;
            });
          },
        ), 
      ),
      routes:<String,WidgetBuilder> {
        '/upload':(BuildContext context) => new Upload(),
              }
            );
          }
        }