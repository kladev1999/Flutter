import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
List<String> updated = <String>['5','55',"1,669",'785','2,333,662','2,333,566','23','9,184','23','867'];
    List<String> date = <String>['19','กรกฎาคม','2565'];
class CovidDATA{
  String txnData ='';  
 int new_case = 0;
 int totalcase = 0;
 int  new_case_excludeabroad = 0;
 int total_case_excludeabroad = 0;
 int new_death = 0;
 int total_death = 0;
 int new_recovered = 0;
 int total_recovered = 0;
 String update_date = '';
  List<int> sum = <int>[];
}


void main() => runApp(MyApp());


const TextStyle mystyle = TextStyle(
  
  fontSize: 60,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  
);

const TextStyle mysyitle = TextStyle(
  
  fontSize: 30,
  color: Colors.yellow,

  
);
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key : key);

    @override
    Widget build(BuildContext context) {
      return(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('ป๋าหลอง ป๋าหลอง',style: TextStyle(fontSize: 30, color: Colors.black )),backgroundColor: Colors.orange),
      body: Appkla(),
      backgroundColor : Color.fromARGB(255,26,49,91)
  )));
    }
}
class Appkla extends StatelessWidget{
  const  Appkla({Key? key}) : super (key : key);
    

  @override
Widget build(BuildContext context){
    getData();
    return FutureBuilder(future: getData(), builder: (BuildContext context, AsyncSnapshot snapshot) { 
      
      if(snapshot.connectionState != ConnectionState.done){
        return LinearProgressIndicator();
      }
      else{
        return Mybody();
      }
     },);
   }
 
}


    CovidDATA c = new CovidDATA();


  Future<dynamic> getData() async{
    var uri = "https://covid19.ddc.moph.go.th/api/Cases/today-cases-all";
    var response = await http.get(Uri.parse(uri));
      Map<String, dynamic> receive = jsonDecode(response.body.substring(1, response.body.length - 1));
       c.new_case = receive["new_case"];
      c.totalcase = receive["total_case"]-2223435;
      c.total_recovered = receive['total_recovered']-2168494;   
      // c.txnData = receive["update_date"];
      // c.new_case_excludeabroad = receive["new_case_excludeabroad"];
      // c.total_case_excludeabroad = receive["total_case_excludeabroad"];
      // c.new_death = receive["new death"];
      // c.total_death = receive["total_death"];
      c.new_recovered = receive["new_recovered"];
      // c.update_date = receive["update_date"];
      print(c.new_recovered);
      print(c.totalcase);
      print(c.total_recovered);
    }

class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {

  
 
  @override
  Widget build(BuildContext context) {
    return(Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.start,children: [
      SizedBox(
        width: 10,
      ),
    Wrap(
      children: [
     
        

      Wrap(
     children: [
         Text('สถานการณ์ Covid-19',style: mystyle,),
        Text('ในประเทศไทย',style:TextStyle(fontSize: 30, color: Colors.white)),
       
              SizedBox(
                  height: 200,
                  
                ),
           
        
         Container(

            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('${date[0]}',style: TextStyle(fontSize: 100, color: Colors.red,fontWeight: FontWeight.bold)),
              Text('${date[1]} ${date[2]}',style: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold)),

            ],),
            height: 300,
            width: 300,
             decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 10),
        ],

          )
          ),
      ]),
      

        

      ]
    

     ),
    
      Wrap(children: [
              SizedBox(
                  height: 760,
                  width: 100,
                  child: VerticalDivider(color: Colors.white,thickness: 5,),
                ),
           ],),
      
      Wrap(children: [
            SizedBox(
      height: 100,
     ),
           Wrap(children: [
            Text('หายป่วยวันนี้',style:mysyitle),
            SizedBox(
              height: 10,
            ),
            Container(
              
              child: Text('+ ${c.new_recovered}',style:TextStyle(fontSize:76 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),


              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )
            )

           ],),
           SizedBox(
            height: 30,
           ),
           
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('จำนวนผู้ป่วยในโรงพยาบาล',style:mysyitle),
            Text('รายใหม่วันนี้',style:mysyitle),
            Text('(By RT-PCR & ATK)',style:TextStyle(fontSize:17 ,color: Colors.yellow,)),
            SizedBox(
              height: 15,
            ),
            Container(child:
               Column(children: [
                 Text('+ ${c.new_case}',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),
                Row(

                  
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                    Center(child: Column(children: [

                    Text('ผู้ป่วยในประเทศ',style: TextStyle(color: Colors.black,),),
                    Text('+${updated[2]}',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,),),
                    ],),),

                       SizedBox(
                  height: 55,
                  width: 40,
                  child: VerticalDivider(color: Colors.black,thickness: 2,),
                ),
                Center(child: Column(children: [
             
             Text('ผู้ป่วยในต่างประเทศ',style: TextStyle(color: Colors.black,),),
             Text('-',style: TextStyle(color: Colors.black,),),
                    ],),),
                    


            
                   ]
                
                )


              ],),
          
              
              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )

            )

           ],),
           SizedBox(
            height: 15,
           ),
           
          ],
          
          ),
          
     Column(mainAxisAlignment: MainAxisAlignment.end,children: [
              SizedBox(
                  height: 760,
                  width: 150,
                  child: VerticalDivider(color: Colors.white,thickness: 5,),
                ),
           ],),
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                SizedBox(
      height: 100,
     ),
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('หายป่วยสะสม',style:mysyitle),
            Text('ตั้งแต่ มกราคม 2565',style:mysyitle),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('${c.total_recovered}',style:TextStyle(fontSize:60 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),


              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )
            )

           ],),
           SizedBox(
            height: 30,
           ),
           
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('ป่วยสะสม',style:mysyitle),
            Text('ตั้งแต่ มกราคม 2565',style:mysyitle),
        
            SizedBox(
              height: 15,
            ),
            Container(child:
               
                 Text('${c.totalcase}',style:TextStyle(fontSize:60 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),
              
              alignment: Alignment.center,
              height: 150,
              width: 300,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )

            )

           ],),
           SizedBox(
            height: 15,
           ),
           
          ],
          
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end,children: [
              SizedBox(
                  height: 760,
                  width: 150,
                  child: VerticalDivider(color: Colors.white,thickness: 5,),
                ),
           ],),
           SizedBox(height: 20,),
    Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          SizedBox(
            height: 50,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('ผู้ป่วยปอดอกเสบ',style:mysyitle),
            Text('รักษาตัอยู่ในโรงพยาบาล',style:mysyitle),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('${updated[3]}',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),


              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )
            )

           ],),
           SizedBox(
            height: 20,
           ),
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('กำลังรักษา',style:mysyitle),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('${updated[8]}',style:TextStyle(fontSize:80 ,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),


              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )
            )

           ],),
           SizedBox(
            height: 30,
           ),
           SizedBox(
            height: 15,
           ),
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('เสียชีวิตเพิ่ม',style:mysyitle),
            SizedBox(
              height: 10,
            ),
            Container(
              child:
              Column(children: [
              
            Text('${updated[6]}',style:TextStyle(fontSize:80,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic)),
              SizedBox(
                  height: 1,
                  width: 250,
                  child: Divider(color: Colors.black,thickness: 2,),
                ),
              Row(

                  
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                   
                    Center(child: Column(children: [
                      
                    Text('เสียชีวิตสะสม',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                    Text('ตั้งแต่ 1 มกราคม 2565',style: TextStyle(fontSize: 10,color: Colors.black,),),
                    ],),),
                    
                       SizedBox(
                  height: 1,
                  width: 25,
                  
                ),
                Center(child: Column(children: [
             
             Text('${updated[7]}',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            
                    ],),),
                    


            
                   ]
                
                )
              
              ],),


              
              height: 150,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          ),
           boxShadow:[
          BoxShadow(color: Colors.grey.shade700, spreadRadius: 5),
        ],

          )
            )

           ],)
           
          ],
          
          
          ),

       
     
      
    ],



     


    ),

    //
    
    )
    
    );
  }
}




      