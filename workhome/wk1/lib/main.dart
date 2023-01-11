import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text('ป๋าหลอง ป๋าหลอง',
              style: TextStyle(fontSize: 30, color: Colors.black)),
          backgroundColor: Colors.orange),
      body: Appkla(),
      backgroundColor: Color.fromARGB(255, 42, 27, 64),
    )));
  }
}

const TextStyle mystyle = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const TextStyle mytime = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

// ignore: camel_case_types
class Images extends StatelessWidget {
  Images({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return (Center(
      child: Images(),
    ));
  }
}

class Appkla extends StatelessWidget {
  Appkla({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return (Center(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 27, 64),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('asset/images/laliga.jpg'))),
              width: 115,
              height: 170,
              // margin: EdgeInsets.all(15),
              // padding: EdgeInsets.all(5),
              alignment: Alignment.center,
            ),
            SizedBox(
              width: 600,
            ),
            Container(
                child: Text(
                  "โปรแกรมการแข่งขัน",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                width: 275,
                height: 75,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(0.8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blue.shade900],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft))),
            SizedBox(
              width: 400,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("true",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
                Text(
                  "visions",
                  style: TextStyle(
                    fontSize: 43,
                    color: Colors.pink,
                  ),
                )
              ]),
              color: Color.fromARGB(255, 255, 255, 255),
              width: 300,
              height: 60,
              // margin: EdgeInsets.all(15),
              // padding: EdgeInsets.all(5),
              alignment: Alignment.center,
            ),
          ]),
          Text('ฟุตบอล ลาลีกา 2021/22',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          SizedBox(
            height: 20,
          ),
          Text('เสาร์ 18 ก.ย.',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/rayo.jpg'))),
                width: 125,
                height: 125,
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "ราโย่",
                  style: mystyle,
                ),

                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    child: Text(
                      "19:00",
                      style: mytime,
                    ),
                    width: 100,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    ))
              ]),
              Container(
                child: Text(
                  "เคตาเฟ่",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/gata.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/At.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "แอตฯมาดริด",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    child: Text(
                      "21:15",
                      style: mytime,
                    ),
                    width: 100,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    ))
              ]),
              Container(
                child: Text(
                  "บิลเบา",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/BB.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/Elche.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "เอลเช่",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    child: Text(
                      "23:30",
                      style: mytime,
                    ),
                    width: 100,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    ))
              ]),
              Container(
                child: Text(
                  "เลบันเต้",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/le.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
            ],
          ),
          Text('อาทิตย์ 19 ก.ย.',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/Alabas.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "อลาเบส",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("02:00", style: mytime),
                          Text(
                            "(คืนวันเสาร์)",
                            style: TextStyle(
                              fontSize: 16.5,
                              color: Colors.white,
                            ),
                          )
                        ]),
                    width: 100,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5),
                    )),

                // margin: EdgeInsets.all(15),

                // padding: EdgeInsets.all(5),
              ]),
              Container(
                child: Text(
                  "โอซาซูน่า",
                  style: mystyle,
                ),
                width: 250,
                height: 50,
                color: Colors.white,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 27, 64),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/osasuna.jpg'))),
                width: 125,
                height: 125,
                // margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(5),
                alignment: Alignment.center,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
