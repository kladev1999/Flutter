import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

List<String> updated = <String>[
  '5',
  '55',
  "1,669",
  '785',
  '2,333,662',
  '2,333,566',
  '23',
  '9,184',
  '23',
  '867'
];
List<String> date = <String>['19', 'กรกฎาคม', '2565'];

class CovidDATA {
  String txnData = '';
  int new_case = 0;
  int totalcase = 0;
  int new_case_excludeabroad = 0;
  int total_case_excludeabroad = 0;
  int new_death = 0;
  int total_death = 0;
  int new_recovered = 0;
  int total_recovered = 0;
  int update_Time = 0;
  String update_date = "";
  List<int> sum = <int>[];
}

// void main() {
//   //Intl.defaultLocale = "th";
//   initializeDateFormatting();
//   runApp(const MyApp_covid());
// }

const TextStyle mystyle = TextStyle(
  fontSize: 18,
  color: Colors.yellow,
  fontWeight: FontWeight.bold,
);

const TextStyle mysyitle = TextStyle(
  fontSize: 22,
  color: Colors.yellow,
  fontWeight: FontWeight.bold,
);
const TextStyle mynum = TextStyle(
  fontSize: 30,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);

class MyApp_covid extends StatelessWidget {
  const MyApp_covid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
            appBar: AppBar(
                title: const Text('สถานะการ Covid-19',
                    style: TextStyle(fontSize: 30, color: Colors.black)),
                backgroundColor: const Color.fromARGB(255, 236, 175, 85)),
            body: const Appkla(),
            backgroundColor: const Color.fromARGB(255, 26, 49, 91)));
  }
}

class Appkla extends StatelessWidget {
  const Appkla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getData();
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LinearProgressIndicator();
        } else {
          return const Mybody();
        }
      },
    );
  }
}

// ignore: unnecessary_new
CovidDATA c = new CovidDATA();

var uri = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
Future<dynamic> getData() async {
  var response = await http.get(Uri.parse(uri));
  Map<String, dynamic> receive =
      jsonDecode(response.body.substring(1, response.body.length - 1));
  c.new_case = receive["new_case"];
  c.totalcase = receive["total_case"] - 2223435;
  c.total_recovered = receive['total_recovered'] - 2168494;
  c.txnData = receive["update_date"];
  c.new_case_excludeabroad = receive["new_case_excludeabroad"];
  c.total_case_excludeabroad = receive["total_case_excludeabroad"];
  c.new_death = receive["new_death"];
  c.total_death = receive["total_death"] - 21698;
  c.new_recovered = receive["new_recovered"];
  c.update_date = receive["update_date"];
}

class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  // ignore: unnecessary_new
  DateTime dateTime = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    var y = DateFormat.y();
    c.update_Time = int.parse(y.format(dateTime));
    c.update_Time += 543;
    // ignore: non_constant_identifier_names
    final T_update = c.update_date.split(" ");
    var format = DateFormat('EEEE ที่ d MMMM ', 'th');
    // ignore: unused_local_variable, unnecessary_new
    var formatter = new NumberFormat("#,###,###");
    // ignore: non_constant_identifier_names
    final D_update = T_update[0].split('-');
    return (Center(
      child: 
      Expanded(child: SingleChildScrollView(child:
      Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              // ignore: sort_child_properties_last
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('${format.format(dateTime)}${c.update_Time}',
                    style: mysyitle),
              ]),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                gradient: LinearGradient(colors: const [
                  Color.fromARGB(255, 26, 49, 91),
                  Color.fromARGB(255, 26, 49, 91)
                ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade100, spreadRadius: 5),
                ],
              )),
          const SizedBox(
            height: 30,
          ),

          // ignore: prefer_const_literals_to_create_immutables
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
                const Text(
                  'หายป่วยวันนี้',
                  style: mystyle,
                ),
                Text(
                  // ignore: unnecessary_string_interpolations
                  '+${formatter.format(c.new_case)}',
                  style: mynum,
                ),
              ]),
              const SizedBox(
                height: 100,
                width: 100,
                child: VerticalDivider(
                  color: Colors.white,
                  thickness: 5,
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.assignment_ind_rounded,
                  color: Colors.red,
                  size: 20,
                ),
                const Text(
                  'รักษาหายวันนี้',
                  style: mystyle,
                ),
                // ignore: unnecessary_string_interpolations
                Text(
                  '+${formatter.format(c.new_recovered)}',
                  style: mynum,
                ),
              ]),
            ]),
            const SizedBox(
              height: 0,
              width: 610,
              child: Divider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'หายป่วยสะสม',
                  style: mystyle,
                ),
                // ignore: unnecessary_string_interpolations
                Text('+${formatter.format(c.totalcase)}',
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
                const SizedBox(
                  height: 50,
                  width: 610,
                  child: Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'จำนวนผู้ป่วยที่รักษาหายสะสม',
                style: mystyle,
              ),
              const SizedBox(
                height: 0,
              ),
              Text('+${formatter.format(c.total_recovered)}',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic)),
              const SizedBox(
                height: 20,
              )
            ]),
            const SizedBox(
              height: 0,
              width: 610,
              child: Divider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'เสียชีวิตรายใหม่',
                    style: mystyle,
                  ),
                  Text(
                    // ignore: unnecessary_string_interpolations
                    '${formatter.format(c.new_death)}',
                    style: mynum,
                  ),
                ]),
                const SizedBox(
                  height: 100,
                  width: 40,
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'เสียชีวิตสะสม',
                    style: mystyle,
                  ),
                  Text(
                    // ignore: unnecessary_string_interpolations
                    '${formatter.format(c.total_death)}',
                    style: mynum,
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 0,
              width: 610,
              child: Divider(
                color: Colors.white,
                thickness: 5,
              ),
            ),
          ]),
          const SizedBox(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'อัพเดทเมื่อเวลา',
              style: mysyitle,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              // ignore: unnecessary_brace_in_string_interps, unnecessary_string_interpolations
              '${T_update[1]}',
              style: mynum,
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'ของวันที่',
              style: mysyitle,
            ),
            const SizedBox(
              width: 10,
              height: 200,
            ),
            Text(
              // ignore: unnecessary_brace_in_string_interps, unnecessary_string_interpolations
              '${D_update[2]}/${D_update[1]}/${D_update[0]}',
              style: mynum,
            )
          ]),
        ],
      ),
    )
    
    )
    ));
  }
}
