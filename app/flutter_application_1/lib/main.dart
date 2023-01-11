import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key : key);

    @override
    Widget build(BuildContext context) {
      return(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('ป๋าหลอง ป๋าหลอง',style: TextStyle(fontSize: 30, color: Colors.black )),backgroundColor: Colors.orange),
      body: Appkla(),
      backgroundColor : Colors.blue[200],
  )));
    }
}
const TextStyle mystyle = TextStyle(
  
  fontSize: 50,
  color: Colors.black
  
);
class Appkla extends StatelessWidget{
  const Appkla({Key? key}) : super (key : key);
  @override
  Widget build(BuildContext context) {
      return( Center(child: 
      Row( 
        body:(title: Text("data"))
      )
      )
    );
  }
}